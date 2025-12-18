part of 'home_wallet_w_import.dart';
class HomeWalletMyWalletBalance extends StatelessWidget {
  const HomeWalletMyWalletBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'رصيد محفظتك الحالي',
                style:
                TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const SizedBox(width: 4),
                  const Text(
                    "200 ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Image.asset("assets/images/Vector (15).png"),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 30),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/Group (4).png',
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
