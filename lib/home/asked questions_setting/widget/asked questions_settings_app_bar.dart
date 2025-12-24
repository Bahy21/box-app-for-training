part of 'asked questions_setting_w_import.dart';
class AskedQuestionSettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AskedQuestionSettingsAppBar({super.key});

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
            "الأسئلة الشائعة",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
