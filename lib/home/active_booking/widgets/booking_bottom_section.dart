part of '../activebooking.dart';

class BookingBottomSection extends StatelessWidget {
  final String price;
  final VoidCallback onLeavePressed;

  const BookingBottomSection({
    super.key,
    required this.price,
    required this.onLeavePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          price,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onLeavePressed,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.orange[500],
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/log-out.png",
                ),
                const SizedBox(width: 8),
                const Text(
                  "مغادرة الوحدة",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


