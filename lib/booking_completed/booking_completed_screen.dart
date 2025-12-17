import 'package:flutter/material.dart';
import '../home/booking_completed.dart';
import 'booking_completed_item.dart';
import 'booking_completed_resv.dart';

class BookingCompletedScreen extends StatelessWidget {
  const BookingCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return BookingCompletedItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BookingCompletedResv(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
