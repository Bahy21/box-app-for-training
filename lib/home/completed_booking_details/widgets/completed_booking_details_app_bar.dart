part of 'completed_booking_details_w_imports.dart';

class CompletedBookingDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CompletedBookingDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/images/Vector.svg"),
          ),
          const SizedBox(width: 15),
          const Text(
            "تفاصيل الحجز",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 75),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "حجز نشط",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
