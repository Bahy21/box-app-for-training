import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  final String phone;
  final String password;
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;

  CreateUserRequest({
    required this.phone,
    required this.password,
    this.fcmToken,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}

