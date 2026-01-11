import 'package:json_annotation/json_annotation.dart';

import '../../api_verify_code/user_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable(createToJson: false)
class RegisterResponseModel {
  final String token;
  final UserModel user;

  RegisterResponseModel({
    required this.token,
    required this.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}

