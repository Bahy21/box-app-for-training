part of 'nafth_page_w_import.dart';

class NafthPageVerify extends StatelessWidget {
  const NafthPageVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOrangeButton(
      text: "التحقق من نفاذ",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Gps()),
        );
      },
    );
  }
}
