import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'active_booking_controller.dart';

part 'widgets/booking_header.dart';
part 'widgets/booking_unit_info.dart';
part 'widgets/booking_bottom_section.dart';
part 'widgets/booking_item.dart';

class ActiveBooking extends StatelessWidget {
  final ActiveBookingController controller = ActiveBookingController();

  ActiveBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return BookingItem(
            doorCode: "589678",
            unitNumber: "1234",
            date: "2024-12-10",
            price: "200 ﷼",
            onTap: () => controller.navigateToBookingDetails(context),
            onLeavePressed: () => controller.handleLeaveUnit(context, "589678"),
          );
        },
      ),
    );
  }
}
