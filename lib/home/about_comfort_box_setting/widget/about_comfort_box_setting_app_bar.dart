part of 'about_comfort_box_setting_w_import.dart';

class AboutComfortBoxSettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AboutComfortBoxSettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      //app bar
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
            "عن -كمفورت بوكس",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
