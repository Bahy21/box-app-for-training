part of 'settings_app_w_imports.dart';
class SettingAppAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SettingAppAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Center(
        child: Text(
          "الاعدادات",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
