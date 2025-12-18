part of 'booking_cinfirmation_page_datails_w_imports.dart';
class BookingCinfirmationPageUnitDetails extends StatelessWidget {
  const BookingCinfirmationPageUnitDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Image.asset(
            "assets/images/Rectangle 4.png",
            height: 122,
            width: 99,
          ),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "رقم الوحدة: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "5697827",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),
      // التاريخ والوقت
      const Text(
        "تاريخ ووقت الحجز",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),
      Row(
        children: [
          SvgPicture.asset(
            "assets/images/calender.svg",
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "16 سبتمبر 2026",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 40),
          SvgPicture.asset(
            "assets/images/time.svg",
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "02:00م - 04:00م",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),

    ],);
  }
}
