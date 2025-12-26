import 'package:flutter/material.dart';

import '../booking_information/booking_information_import.dart';

class ActiveBookingController {
  // Navigate to booking details
  void navigateToBookingDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeBooking()),
    );
  }

  // Handle leave unit action
  void handleLeaveUnit(BuildContext context, String unitCode) {
    // TODO: Implement leave unit logic
    print('Leaving unit: $unitCode');
  }
}



