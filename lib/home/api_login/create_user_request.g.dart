// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      phone: json['phone'] as String,
      password: json['password'] as String,
      fcmToken: json['fcm_token'] as String?,
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'fcm_token': instance.fcmToken,
    };
