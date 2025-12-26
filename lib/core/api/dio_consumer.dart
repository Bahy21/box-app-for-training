import 'dart:convert';
import 'dart:io';

import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../main.dart';
import '../constants/api_constants.dart';
import '../constants/app_cached.dart';
import '../di/di.dart';
import '../errors/exceptions.dart';
import '../local/shared_preferences/shared_pref_services.dart';
import '../util/routing/routes.dart';
import '../widgets/custom_login_expired_dialog.dart';
import 'api_consumer.dart';
import 'api_status_codes.dart';
import 'base_response.dart';
import 'dio_log_interceptor.dart';
import 'network_info.dart';

@LazySingleton(as: ApiConsumer)
class DioApiConsumer extends ApiConsumer {
  final Dio dioClient;
  final NetworkInfo networkInfo;
  final SharedPrefServices appPref;

  DioApiConsumer({
    required this.networkInfo,
    required this.dioClient,
    required this.appPref,
  }) {
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final dioClient = HttpClient();
      dioClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return dioClient;
    };

    dioClient.options
      ..baseUrl = ApiConstants.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ApiStatusCodes.internalServerError;
      };

    if (kDebugMode) {
      dioClient.interceptors.add(getIt<DioLogInterceptor>());
    }
  }

  Map<String, dynamic> getHeaders({String? sendToken}) {
    // Get language from SharedPreferences, fallback to easy_localization, or default to 'ar'
    String? storedLang = appPref.getData(key: AppCached.lang);
    String lang;
    
    if (storedLang != null && storedLang.isNotEmpty) {
      lang = storedLang;
    } else {
      // Try to get from easy_localization context
      try {
        final context = MyApp.appNavigatorKey.currentState?.context;
        if (context != null) {
          lang = context.locale.languageCode;
        } else {
          lang = 'ar'; // Default fallback
        }
      } catch (e) {
        lang = 'ar'; // Default fallback
      }
    }
    
    // Ensure lang is one of the supported languages
    if (lang != 'ar' && lang != 'en' && lang != 'ur') {
      lang = 'ar'; // Default to Arabic if invalid
    }
    
    String token = appPref.getData(key: AppCached.token) ?? "";
    if (token.isNotEmpty) {
      return {
        'Accept': 'application/json',
        'Accept-Language': lang,
        'api-key': '11223344',
        if (sendToken != null) 'Authorization': 'Bearer $sendToken',
        if (sendToken == null) 'Authorization': 'Bearer $token',
      };
    } else {
      return {
        'Accept': 'application/json',
        'Accept-Language': lang,
        'api-key': '11223344',
        if (sendToken != null) 'Authorization': 'Bearer $sendToken',
      };
    }
  }

  @override
  Future get(
    String endPoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    String? token,
  }) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final Response response = await dioClient.get(
          endPoint,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          options: Options(headers: getHeaders(sendToken: token)),
        );
        return handleResponseOnly(response: response);
      } on DioException catch (error) {
        return _handelDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }

  @override
  Future post(
    String endPoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    String? token,
  }) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final Response response = await dioClient.post(
          endPoint,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          options: Options(headers: getHeaders(sendToken: token)),
        );
        return handleResponseOnly(response: response);
      } on DioException catch (error) {
        return _handelDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }

  handleResponseOnly({required Response response}) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return _handleResponseAsJson(response: response);
    } else if (response.statusCode == 422 || 
               response.statusCode == 400 ||
               response.statusCode == 403) {
      // 403: Forbidden - account disabled/blocked, return response to show server message
      return _handleResponseAsJson(response: response);
    } else if (response.statusCode == 401) {
      // 401: Unauthorized - token expired or invalid
      clearDataUser();
      throw UnauthorizedException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500 ||
        response.statusCode == 307 ||
        response.statusCode == 504) {
      throw ServerErrorException();
    } else {
      // Handle any other unexpected status codes
      return _handleResponseAsJson(response: response);
    }
  }

  clearDataUser() {
    try {
      Future.wait([
        appPref.removeData(key: AppCached.role),
        appPref.removeData(key: AppCached.userId),
        appPref.removeData(key: AppCached.isOnline),
        appPref.removeData(key: AppCached.token),
      ]);
      handleResponse401();
    } catch (error) {
      throw ServerErrorException();
    }
  }

  handleResponse401() {
    final context = MyApp.appNavigatorKey.currentState!.context;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        Future.delayed(const Duration(seconds: 3), () {
          if (context.mounted) {
            context.pushAndRemoveUntilWithNamed(Routes.loginView);
          }
        });
        return const CustomLoginExpiredDialog();
      },
    );
  }

  BaseResponse _handleResponseAsJson({required Response<dynamic> response}) {
    final responseJson = jsonDecode(response.data.toString());
    return BaseResponse.fromJson(responseJson);
  }

  dynamic _handelDioError({required DioException error}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw TimeOutException();
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException();
      case DioExceptionType.sendTimeout:
        throw TimeOutException();
      case DioExceptionType.receiveTimeout:
        throw TimeOutException();
      case DioExceptionType.badResponse:
        if (error.response!.statusCode == 404) {
          throw NotFoundException();
        } else if (error.response!.statusCode == 500 ||
            error.response!.statusCode == 307 ||
            error.response!.statusCode == 504) {
          throw ServerErrorException();
        }
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (error.type.name.contains("SocketException")) {
          throw NoInternetConnectionException();
        }
        throw UnKnownException();
    }
  }
}
