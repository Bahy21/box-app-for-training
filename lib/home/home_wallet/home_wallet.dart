part of 'home_wallet_import.dart';

class ViewWallet extends StatelessWidget {
  const ViewWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: const HomeWalletWAppBar(),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: const Column(
                children: [
                  // my wallet balance
                  HomeWalletMyWalletBalance(),
                ],
              )),
          // wallet top up
          const HomeWalletWalletTopUp(),
          const SizedBox(height: 40),
          // transaction top up
          const HomeWalletTransactionTopUp(),

        ],
      ),
    );
  }
}
