import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class UserModel {
  final int? id;
  final String name;
  final String phone;
  final String? avatar;
  final String? email;
  final String? lat;
  final String? long;
  final String? address;
  final String? balance;
  final String? role;
  final String? city;
  @JsonKey(name: 'city_id')
  final int? cityId;
  @JsonKey(name: 'city_name')
  final String? cityName;

  @JsonKey(name: 'has_location')
  final bool? hasLocation;

  @JsonKey(name: 'service_id')
  final int? serviceId;
  @JsonKey(name: 'service_name')
  final String? serviceName;
  @JsonKey(name: 'identity_number')
  final String? identityNumber;
  @JsonKey(name: 'identity_image')
  final String? identityImage;
  @JsonKey(name: 'receive_notifications')
  final bool? isNotify;
  @JsonKey(name: 'is_online')
  final bool? isOnline;
  @JsonKey(name: 'is_nafath_verified')
  final bool? isNafathVerified;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    this.email,
    this.lat,
    this.long,
    this.address,
    this.balance,
    this.role,
    this.city,
    this.cityId,
    this.cityName,
    this.hasLocation,
    this.serviceId,
    this.serviceName,
    this.identityNumber,
    this.identityImage,
    this.isNotify,
    this.isOnline,
    this.isNafathVerified,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? avatar,
    String? email,
    String? lat,
    String? long,
    String? address,
    String? balance,
    String? role,
    String? city,
    int? cityId,
    String? cityName,
    bool? hasLocation,
    int? serviceId,
    String? serviceName,
    String? identityNumber,
    String? identityImage,
    bool? isNotify,
    bool? isOnline,
    bool? isNafathVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      address: address ?? this.address,
      balance: balance ?? this.balance,
      role: role ?? this.role,
      city: city ?? this.city,
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
      hasLocation: hasLocation ?? this.hasLocation,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      identityNumber: identityNumber ?? this.identityNumber,
      identityImage: identityImage ?? this.identityImage,
      isNotify: isNotify ?? this.isNotify,
      isOnline: isOnline ?? this.isOnline,
      isNafathVerified: isNafathVerified ?? this.isNafathVerified,
    );
  }
}
