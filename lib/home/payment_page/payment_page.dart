part of 'payment_page_import.dart';

class WalletTwo extends StatefulWidget {
  const WalletTwo({super.key});

  @override
  State<WalletTwo> createState() => _WalletTwoState();
}

class _WalletTwoState extends State<WalletTwo> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      //app bar
      appBar:PaymentPageAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30),
          PaymentPagePaymentAmount(),
          SizedBox(height: 30),
          //payment method
          PaymentPagePaymentMethod(),
          // top up
          PaymentPageTopUp(),
        ],
      ),
    );
  }
}
