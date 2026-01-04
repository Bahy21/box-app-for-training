// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_points_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyPointsModel _$LoyaltyPointsModelFromJson(Map<String, dynamic> json) =>
    LoyaltyPointsModel(
      balance: (json['balance'] as num).toInt(),
      history: (json['history'] as List<dynamic>)
          .map((e) =>
              LoyaltyPointsHistoryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoyaltyPointsModelToJson(LoyaltyPointsModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'history': instance.history,
    };
