part of 'login_page_w_import.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "الأسم كامل",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const CustomTextField(hintText: "My name"),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "البريد الاكتوني",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const CustomTextField(
          hintText: "E-mail",
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "المدينة",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const CustomTextField(
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 20,
            color: Colors.black,
          ),
          hintText: "City",
        ),
        const SizedBox(
          height: 150,
        ),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "من خلال إنشاء حساب فإنك توافق على الشروط والأحكام و سياسة الخصوصية",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
