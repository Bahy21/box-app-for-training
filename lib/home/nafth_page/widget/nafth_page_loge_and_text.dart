part of 'nafth_page_w_import.dart';

class NafthPageLogeAndText extends StatelessWidget {
  const NafthPageLogeAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset("assets/images/Frame 2.png"),
        ),
        const SizedBox(height: 20),
        // العنوان
        Center(
          child: const Text(
            "وثق حسابك عبر النفاذ الوطني",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            "يجب عليك استكمال عملية التسجيل حتى يمكنك استخدام هذه الخدمة.",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
