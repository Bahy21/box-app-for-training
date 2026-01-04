part of '../activebooking.dart';

class BookingItem extends StatelessWidget {
  final String doorCode;
  final String unitNumber;
  final String date;
  final String price;
  final VoidCallback onTap;
  final VoidCallback onLeavePressed;

  const BookingItem({
    super.key,
    required this.doorCode,
    required this.unitNumber,
    required this.date,
    required this.price,
    required this.onTap,
    required this.onLeavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        height: 220,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingHeader(doorCode: doorCode),
            const Divider(thickness: 1),
            const SizedBox(height: 15),
            BookingUnitInfo(
              unitNumber: unitNumber,
              date: date,
            ),
            const Spacer(),
            BookingBottomSection(
              price: price,
              onLeavePressed: onLeavePressed,
            ),
          ],
        ),
      ),
    );
  }
}




