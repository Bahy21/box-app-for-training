part of '../activebooking.dart';

class BookingHeader extends StatelessWidget {
  final String doorCode;

  const BookingHeader({
    super.key,
    required this.doorCode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/images/door.svg"),
        const Text(
          "كود فتح الباب",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 100),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            doorCode,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

