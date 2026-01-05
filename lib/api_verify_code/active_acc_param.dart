import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_acc_param.g.dart';

@JsonSerializable(createFactory: false)
class ActiveAccParameter {
  final String phone;
  final String code;

  ActiveAccParameter({
    required this.phone,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "code": code,
  };
}
