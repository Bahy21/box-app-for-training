import 'package:json_annotation/json_annotation.dart';

part 'lang_param.g.dart';

@JsonSerializable(createFactory: false)
class LangParam {
  final String lang;

  LangParam({required this.lang});

  Map<String, dynamic> toJson() => _$LangParamToJson(this);
}
