class AppStatus {
  static const String pending = 'pending';
  static const String scheduled = 'scheduled';
  static const String cancelled = 'cancelled';
  static const String inWayToCustomer = 'in_way_to_customer';
  static const String beingInspected = 'being_inspected';

  static const String waitingPayment = 'waiting_payment';
  static const String inProgress = 'in_progress';
  static const String waitingCustomerConfirmation =
      'waiting_customer_confirmation';
  static const String completedOrder = 'completed_order';

  static const String noAgreement = 'no_agreement';

  static const String searchingTechnical = 'searching_technical';
  static const String inWayToCustomerClient = 'in_way_to_customer_client';
  static const String beingInspectedClient = 'being_inspected_client';
  static const String waitingPayServiceFee = 'waiting_pay_service_fee';
  static const String waitingConfirmOrder = 'waiting_confirm_order';
  static const String orderSuccessfully = 'order_successfully';

  // [8:17 pm, 28/07/2024] Ahmed El-Desoqy (link Company ):
  // case Pending = 1; // 'pending';
  //
  // case Scheduled = 2; // 'scheduled';
  //
  // case Cancelled = 2; // 'cancelled';
  //
  // case InWayToCustomer = 3; // 'in_way_to_customer';
  //
  // case BeingInspected = 4; // 'being_inspected';
  //
  // case NoAgreement = 5; // 'no_agreement';
  //
  // case WaitingPayment = 6; // 'waiting_payment';
  //
  // case InProgress = 7; // 'in_progress';
  //
  // case WaitingCustomerConfirmation = 8; // 'waiting_customer_confirmation';

  // case CompletedOrder = 9; // 'completed_order';

  // case SearchingTechnical = 10; // 'searching_technical';
  //
  // case Scheduled = 11; // 'scheduled';
  //
  // case InWayToCustomerClient = 12; // 'in_way_to_customer_client';
  //
  // case BeingInspectedClient = 13; // 'being_inspected_client';
  //
  // case NoAgreement = 14; // 'no_agreement';
  //
  // case WaitingPayServiceFee = 15; // 'waiting_pay_service_fee';
  //
  // case InProgress = 16; // 'waiting_confirm_order';
  //
  // case WaitingConfirmOrder = 17; // 'waiting_confirm_order';
  //
  // case OrderSuccessfully  = 18; // 'order_successfully';
}
