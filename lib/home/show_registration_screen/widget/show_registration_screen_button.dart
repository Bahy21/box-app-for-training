part of 'show_registration_screen_w_import.dart';
class ShowRegistrationScreenButton extends StatelessWidget {
  const ShowRegistrationScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomOrangeButton(
      text: "تسجيل الدخول",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NextPage()),
        );
      },
    );
  }
}
