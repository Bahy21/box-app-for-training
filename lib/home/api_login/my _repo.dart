/*import 'package:boxapp/home/api_login/user.dart';
import 'package:boxapp/home/api_login/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo({required this.webServices});

  Future<User> createNewUser({
    required String phone,
    required String password,
    String? token,
  }) async {
    final body = {
      'phone': phone,
      'password': password,
    };

    return await webServices.createNewUser(
      token != null && token.isNotEmpty ? 'Bearer $token' : '',
      body,
    );
  }
}

 */
import 'user.dart';
import 'web_services.dart';
import 'package:dio/dio.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo({required this.webServices});

  Future<User> createNewUser({
    required String phone,
    required String password,
    String token = '446af5a5sfsdfa', // التوكن اللي ادتهالك
  }) async {
    final body = {
      'phone': phone,
      'password': password,
    };

    return await webServices.createNewUser(token, body);
  }
}

