part of 'login_page_w_import.dart';
class bottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset("assets/images/Frame 2.png"),
          const SizedBox(height: 20),
          const Text(
            "وثق حسابك عبر النفاذ الوطني",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "يجب عليك استكمال عملية التسجيل حتى يمكنك استخدام هذه الخدمة.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          CustomOrangeButton(
            text: "التحقق من نفاذ",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NafathPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
