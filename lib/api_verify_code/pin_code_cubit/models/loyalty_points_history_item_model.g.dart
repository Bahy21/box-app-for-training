// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_points_history_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyPointsHistoryItemModel _$LoyaltyPointsHistoryItemModelFromJson(
        Map<String, dynamic> json) =>
    LoyaltyPointsHistoryItemModel(
      points: (json['points'] as num).toInt(),
      type: (json['type'] as num?)?.toInt(),
      notes: json['notes'] as String?,
      reservationNumber: json['reservation_number'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$LoyaltyPointsHistoryItemModelToJson(
        LoyaltyPointsHistoryItemModel instance) =>
    <String, dynamic>{
      'points': instance.points,
      'type': instance.type,
      'notes': instance.notes,
      'reservation_number': instance.reservationNumber,
      'created_at': instance.createdAt,
    };
