/*
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController phoneController = TextEditingController();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://tan-cat-176794.hostingersite.com/api/v1/",
      headers: {
        "Authorization": "446af5a5sfsdfa", // 🔑 التوكن
      },
    ),
  );

  void login() async {
    emit(LoginLoading());

    try {
      final response = await dio.post(
        "auth/login",
        data: {
          "phone": phoneController.text,
        },
      );

      final data = response.data;

      if (data["status"] == true) {
        emit(LoginSuccess(message: data["message"]));
      } else {
        emit(LoginError(error: data["message"]));
      }
    } catch (e) {
      emit(LoginError(error: "حصل خطأ في الاتصال"));
    }
  }
}

 */
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'api_servies.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiService apiService;

  LoginCubit({required this.apiService}) : super(LoginInitial());

  void login(String phone) async {
    emit(LoginLoading());

    // try {
      // استدعاء الـ API
      final data = await apiService.login(phone);

      print("=================== RESPONSE ===================");
      print(data);
      print("===============================================");

      if (data["status"] == true) {
        print("SUCCESS MESSAGE => ${data["message"]}");
        emit(LoginSuccess(message: data["message"]));
      } else {
        print("ERROR MESSAGE => ${data["message"]}");
        emit(LoginError(error: data["message"]));
      }
    // } catch (e) {
    //   print("=================== EXCEPTION ===================");
    //   print(e);
    //   print("===============================================");
    //   emit(LoginError(error: "حصل خطأ في الاتصال"));
    // }
  }
}
