import 'package:json_annotation/json_annotation.dart';

part 'create_acc_user_param.g.dart';

@JsonSerializable(createFactory: false)
class CreateAccUserParam {
  final String name;
  final String email;
  @JsonKey(name: 'city_id')
  final String cityId;

  CreateAccUserParam({
    required this.name,
    required this.email,
    required this.cityId, required String fullName, required String city,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "cityId":cityId,
  };
}
