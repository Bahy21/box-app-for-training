import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
    BaseOptions(
      baseUrl: "http://comfort-box.test/api/v1/",
      headers: {
       "Content-Type": "application/json",
      },
      //followRedirects: true,
      //validateStatus: (status) => status! < 500,
    ),
  );

  Future<Map<String, dynamic>> login(String phone) async {
    final response = await dio.post(
      "auth/login",
      data: {"phone": phone},
    );
    log(response.realUri.toString());

    print("RESPONSE STATUS => ${response.statusCode}");
    print("RESPONSE DATA => ${response.data}");

    // لو البيانات جايه String HTML مش JSON، اعطي رسالة واضحة بدل الكراش
    if (response.data is String) {
      throw Exception(
          "111111111111111111111111111111111111.");
    }

    return response.data; // هنا مفروض تكون Map<String, dynamic>
  }
}
