part of 'booking_information_w_import.dart';
class BookingInformationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingInformationAppBar({super.key});

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
                color: Colors.orange,
                border: Border.all(color: Colors.orangeAccent),
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
  Size get preferredSize => Size.fromHeight(50);
}
