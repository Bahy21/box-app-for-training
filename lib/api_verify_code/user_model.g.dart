// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      address: json['address'] as String?,
      balance: json['balance'] as String?,
      role: json['role'] as String?,
      city: json['city'] as String?,
      cityId: (json['city_id'] as num?)?.toInt(),
      cityName: json['city_name'] as String?,
      hasLocation: json['has_location'] as bool?,
      serviceId: (json['service_id'] as num?)?.toInt(),
      serviceName: json['service_name'] as String?,
      identityNumber: json['identity_number'] as String?,
      identityImage: json['identity_image'] as String?,
      isNotify: json['receive_notifications'] as bool?,
      isOnline: json['is_online'] as bool?,
      isNafathVerified: json['is_nafath_verified'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'email': instance.email,
      'lat': instance.lat,
      'long': instance.long,
      'address': instance.address,
      'balance': instance.balance,
      'role': instance.role,
      'city': instance.city,
      'city_id': instance.cityId,
      'city_name': instance.cityName,
      'has_location': instance.hasLocation,
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'identity_number': instance.identityNumber,
      'identity_image': instance.identityImage,
      'receive_notifications': instance.isNotify,
      'is_online': instance.isOnline,
      'is_nafath_verified': instance.isNafathVerified,
    };
