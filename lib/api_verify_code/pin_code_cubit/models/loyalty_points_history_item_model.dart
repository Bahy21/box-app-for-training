import 'package:json_annotation/json_annotation.dart';

part 'loyalty_points_history_item_model.g.dart';

@JsonSerializable()
class LoyaltyPointsHistoryItemModel {
  final int points;
  final int? type;
  final String? notes;
  @JsonKey(name: 'reservation_number')
  final String? reservationNumber;
  @JsonKey(name: 'created_at')
  final String createdAt;

  LoyaltyPointsHistoryItemModel({
    required this.points,
    this.type,
    this.notes,
    this.reservationNumber,
    required this.createdAt,
  });

  factory LoyaltyPointsHistoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPointsHistoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoyaltyPointsHistoryItemModelToJson(this);
}

