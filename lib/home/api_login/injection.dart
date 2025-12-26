/*
import 'package:api_dart/cubit/my_cubit.dart';
import 'package:api_dart/my_repo.dart';
import 'package:api_dart/web_services.dart';
import 'package:boxapp/home/api_login/web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'cubit/my_cubit.dart';
import 'my _repo.dart';
// مستخدم ال get it
final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt(), webServices: null));
  getIt.registerLazySingleton<WebServices>(
          () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio.options
    ..connectTimeout = const Duration(seconds: 1)
    ..receiveTimeout = const Duration(seconds: 2);

  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );

  return dio; // 👈 أهم حاجة!
}
//9cb85f9e016982ab1efaf64126d150f60c46d76fc967351bc45dc06a012b6f1b

 */