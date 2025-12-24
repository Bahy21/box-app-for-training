part of 'home_profile_setting_w_import.dart';
class HomeProfileSettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeProfileSettingAppBar({super.key});

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
              width: 30, // حجم مناسب
              height: 30,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "ملفي الشخصي",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
