part of 'payment_page_w_import.dart';

class PaymentPagePaymentAmount extends StatelessWidget {
  const PaymentPagePaymentAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child:
              //payment amount
              Align(
            alignment: Alignment.topRight,
            child: Text(
              "قيمة الشحن",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: 'حدد قيمة الشحن',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  'assets/images/coin.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
