part of 'settings_app_w_imports.dart';
class SettingAppPoints extends StatelessWidget {
  const SettingAppPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Image.asset(
            'assets/images/money.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 8),
          Text(
            "نقاط ولاء",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const Spacer(), // يملأ المساحة الفارغة بين النص واليمين
          Text(
            "500 نقاط",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/images/Vector (22).png',
          ),
        ],
      ),
    );
  }
}
