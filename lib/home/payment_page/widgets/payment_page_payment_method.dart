part of 'payment_page_w_import.dart';

class PaymentPagePaymentMethod extends StatefulWidget {
  const PaymentPagePaymentMethod({super.key});

  @override
  State<PaymentPagePaymentMethod> createState() =>
      _PaymentPagePaymentMethodState();
}

class _PaymentPagePaymentMethodState extends State<PaymentPagePaymentMethod> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          "طريقة الدفع",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          //  border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            // البطاقة الائتمانية
            Row(
              children: [
                Radio<String>(
                  value: "card",
                  groupValue: selectedPayment,
                  onChanged: (val) {
                    setState(() {
                      selectedPayment = val;
                    });
                  },
                ),
                const SizedBox(width: 8),

                Text(
                  "البطاقة الائتمانية",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(
                  flex: 12,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Image.asset(
                    "assets/images/image 5.png",
                    height: 20,
                  ),
                ),
                // SizedBox(width: 2,)
              ],
            ),
            const Divider(),
            // Apple Pay
            Row(
              children: [
                Radio<String>(
                  value: "wallet",
                  groupValue: selectedPayment,
                  onChanged: (val) {
                    setState(() {
                      selectedPayment = val;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Apple Pay",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Image.asset(
                  "assets/images/apple-pay 1 1 2.png",
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      SizedBox(height: 100,),

    ],
    );
  }
}
