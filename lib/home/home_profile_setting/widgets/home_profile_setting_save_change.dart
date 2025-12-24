part of 'home_profile_setting_w_import.dart';
class HomeProfileSettingSaveChange extends StatelessWidget {
  const HomeProfileSettingSaveChange({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "حفظ التغييرات",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
