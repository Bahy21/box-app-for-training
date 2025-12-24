import 'package:boxapp/home/api_login/create_user_request.dart';
import 'package:boxapp/home/api_login/user.dart';
import 'package:boxapp/home/api_login/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo({required this.webServices});

  Future<User> createNewUser({
    required String phone,
    required String password,
    String? fcmToken,
    String? token,
  }) async {
    final request = CreateUserRequest(
      phone: phone,
      password: password,
      fcmToken: fcmToken,
    );

    return await webServices.createNewUser(
      token ?? "Bearer 34q1q2w3eo99",
      request.toJson(),
    );
  }
}
