part of 'login_page_w_import.dart';
class LoginPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
