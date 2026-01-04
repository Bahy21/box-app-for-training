import 'package:json_annotation/json_annotation.dart';

import 'loyalty_points_history_item_model.dart';

part 'loyalty_points_model.g.dart';

@JsonSerializable()
class LoyaltyPointsModel {
  final int balance;
  final List<LoyaltyPointsHistoryItemModel> history;

  LoyaltyPointsModel({
    required this.balance,
    required this.history,
  });

  factory LoyaltyPointsModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPointsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoyaltyPointsModelToJson(this);
}



