part of 'payment_page_w_import.dart';
class PaymentPageTopUp extends StatelessWidget {
  const PaymentPageTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10), // المسافة الداخلية رأسياً
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // التحكم في المسافة من الجوانب
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "شحن",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    )
    ;
  }
}
