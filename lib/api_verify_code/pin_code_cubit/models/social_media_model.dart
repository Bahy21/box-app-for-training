import 'package:json_annotation/json_annotation.dart';

part 'social_media_model.g.dart';

@JsonSerializable(createToJson: false)
class SocialMediaModel {
  final String whatsapp, twitter, android, ios;

  SocialMediaModel({
    required this.whatsapp,
    required this.twitter,
    required this.android,
    required this.ios,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaModelFromJson(json);
}
