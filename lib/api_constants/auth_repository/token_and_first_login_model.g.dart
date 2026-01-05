// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_and_first_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenAndFirstLoginModel<T> _$TokenAndFirstLoginModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    TokenAndFirstLoginModel<T>(
      message: _$nullableGenericFromJson(json['message'], fromJsonT),
      token: json['token'] as String,
      firstLogin: json['first_login'] as bool,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
