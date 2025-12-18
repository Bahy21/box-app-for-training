part of 'home_wallet_w_import.dart';
class HomeWalletWAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeWalletWAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      title: const Center(
        child: Text(
          "حجوزاتي",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
