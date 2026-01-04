import 'package:json_annotation/json_annotation.dart';

import '../../api_verify_code/user_model.dart';


part 'token_and_first_login_model.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class TokenAndFirstLoginModel<T> {
  final String token;
  @JsonKey(name: 'first_login')
  final bool firstLogin;
  final T message;
  final UserModel? user;

  TokenAndFirstLoginModel({
    required this.message,
    required this.token,
    required this.firstLogin,
    this.user,
  });

  factory TokenAndFirstLoginModel.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$TokenAndFirstLoginModelFromJson(json, fromJsonT);
}
