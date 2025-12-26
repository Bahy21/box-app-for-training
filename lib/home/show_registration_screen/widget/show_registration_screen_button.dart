part of 'show_registration_screen_w_import.dart';

class ShowRegistrationScreenButton extends StatelessWidget {
  const ShowRegistrationScreenButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NextPage()), // غير NextPage بالصفحة اللي انتِ عايزاها
        );
      },
      child: const CustomOrangeButton(
        text: "تسجيل الدخول",
        onTap: null, // نخلي الزرار نفسه مش بيتصرف
      ),
    );
  }
}
