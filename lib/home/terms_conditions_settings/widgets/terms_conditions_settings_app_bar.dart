part of 'terms_conditions_settings_w_import.dart';
class TermsConditionsSettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TermsConditionsSettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/right-arrow.png",
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "الشروط والأحكام",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
