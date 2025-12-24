import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User{
  bool? status;
  String? message;
  List<dynamic>? data;

  User({this.status, this.message, this.data});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

}