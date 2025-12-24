import 'package:boxapp/home/api_login/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://tan-cat-176794.hostingersite.com/api/v1/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST("auth/login")
  Future<User> createNewUser(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );
}
