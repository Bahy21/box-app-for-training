import 'package:flutter/material.dart';
import 'widgets/header_row.dart';
import 'widgets/price.dart';

class BookingCompletedItem extends StatelessWidget {
  final VoidCallback onTap;

  const BookingCompletedItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 180,
        padding: const EdgeInsets.only(top: 50, right: 10, left: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HeaderRow(),
            SizedBox(height: 5),
            Price(),
          ],
        ),
      ),
    );
  }
}
