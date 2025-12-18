part of 'payment_page_w_import.dart';

class PaymentPageAppBar extends StatelessWidget implements PreferredSizeWidget{
  const PaymentPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "شحن الرصيد",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
