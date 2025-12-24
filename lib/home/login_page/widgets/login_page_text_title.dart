part of 'login_page_w_import.dart';

class LoginPageTextTitle extends StatelessWidget {
  const LoginPageTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "مرحباً بك من جديد",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "أدخل بياناتك لإنشاء حساب جديد",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
