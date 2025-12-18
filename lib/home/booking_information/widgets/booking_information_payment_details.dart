part of 'booking_information_w_import.dart';
class BookingInformationPaymentDetails extends StatelessWidget {
  const BookingInformationPaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "طريقة الدفع",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 75),
        SvgPicture.asset(
          "assets/images/wallet.svg",
          width: 28,
          height: 28,
        ),
        const SizedBox(width: 12),
        const Text(
          "محفظة كمفورت بوكس",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );

  }
}
