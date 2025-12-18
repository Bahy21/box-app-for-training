part of 'booking_information_w_import.dart';
class BookingInformationBookingDateAndTime extends StatelessWidget {
  const BookingInformationBookingDateAndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "تاريخ ووقت الحجز",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
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
