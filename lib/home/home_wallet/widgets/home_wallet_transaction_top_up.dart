part of 'home_wallet_w_import.dart';
class HomeWalletTransactionTopUp extends StatelessWidget {
  const HomeWalletTransactionTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 220),
        child: Text(
          "سجّل المعاملات",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/wallet (1).png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "شحن رصيد",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 9),
                Stack(
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 4),
                        Text(
                          "23 أبريل 2025، 08:00ص",
                          style:
                          TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 15,
                      top: -8,
                      child: Row(
                        children: [
                          const Text(
                            "+ 500",
                            style:
                            TextStyle(fontSize: 22, color: Colors.black),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            "assets/images/coin.png",
                            width: 20,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      Container(
        width: 300,
        child: Divider(
          height: 30,
          thickness: 1,
          color: Colors.grey,
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              "assets/images/Vector (20).png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "دفع فاتورة #589654",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 9),
                Stack(
                  children: [
                    Row(
                      children: const [
                        SizedBox(width: 4),
                        Text(
                          "23 أبريل 2025، 08:00ص",
                          style:
                          TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 15,
                      top: -8,
                      child: Row(
                        children: [
                          const Text(
                            "- 500",
                            style:
                            TextStyle(fontSize: 22, color: Colors.redAccent),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            "assets/images/coin.png",
                            width: 20,
                            color: Colors.redAccent,
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),

    ],);
  }
}


