class LoyaltyTransactionModel {
  final String orderNumber;
  final String date;
  final int points;
  final bool isPositive;

  LoyaltyTransactionModel({
    required this.orderNumber,
    required this.date,
    required this.points,
    required this.isPositive,
  });
}
