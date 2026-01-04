import 'dart:io';

import 'package:box_app/api_verify_code/remote/setting_remote_data_source.dart';
import 'package:box_app/core/api/api_consumer.dart';
import 'package:box_app/core/api/base_response.dart';
import 'package:box_app/core/constants/api_constants.dart';
import 'package:box_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../parms/lang_param.dart';
import '../parms/update_profile_param.dart';
import '../pin_code_cubit/models/loyalty_points_model.dart';
import '../pin_code_cubit/models/social_media_model.dart';
import '../user_model.dart';

@Injectable(as: SettingRemoteDataSource)
class SettingRemoteDataSourceImpl extends SettingRemoteDataSource {
  final ApiConsumer apiConsumer;

  SettingRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> deleteAcc() async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.deleteAcc,
      body: {},
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> logOut() async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.logout,
      body: {},
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> toggleNotification() async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.toggleNotifications,
      body: {},
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<SocialMediaModel> fetchSocialMedias() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.socialMedia);
    if (response.status == true) {
      return SocialMediaModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<UserModel> authUser() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.authUser);
    if (response.status == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> changeLang({required LangParam param, String? token}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.changeLang,
      body: param.toJson(),
      token: token,
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<UserModel> updateProfile({
    required UpdateProfileParam param,
    required String token,
  }) async {
    Map<String, dynamic> body = {};
    
    if (param.name != null && param.name!.isNotEmpty) {
      body['name'] = param.name;
    }
    
    if (param.email != null && param.email!.isNotEmpty) {
      body['email'] = param.email;
    }
    
    if (param.cityId != null) {
      body['city_id'] = param.cityId;
    }
    
    if (param.avatar != null) {
      body['avatar'] = MultipartFile.fromFileSync(param.avatar!.path);
    }
    
    BaseResponse response = await apiConsumer.post(
      ApiConstants.updateProfile,
      body: body,
      formDataIsEnabled: param.avatar != null,
      token: token,
    );
    
    if (response.status == true) {
      Map<String, dynamic> userData = Map<String, dynamic>.from(response.data);
      if (userData['city'] != null && userData['city'] is Map) {
        Map<String, dynamic> cityObj = userData['city'];
        userData['city_id'] = cityObj['id'];
        userData['city_name'] = cityObj['name'];
        userData['city'] = cityObj['name'];
      }
      return UserModel.fromJson(userData);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<LoyaltyPointsModel> getLoyaltyPoints() async {
    BaseResponse response = await apiConsumer.get(
      ApiConstants.loyaltyPoints,
    );
    if (response.status == true) {
      return LoyaltyPointsModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
