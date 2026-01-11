import 'package:json_annotation/json_annotation.dart';

part 'select_location_param.g.dart';

@JsonSerializable(createFactory: false)
class SelectLocationParam {
  @JsonKey(name: 'service_id')
  final String serviceId;

  final String lat, long;

  SelectLocationParam({
    required this.serviceId,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toJson() => _$SelectLocationParamToJson(this);
}
