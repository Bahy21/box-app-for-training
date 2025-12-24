part of 'send_otp_page_w_import.dart';
class SendOtpPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SendOtpPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
