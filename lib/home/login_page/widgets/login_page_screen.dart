part of 'login_page_w_import.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAccUserCubit>();
    return  Column(
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
        CustomTextField(hintText: "My name",
         controller: cubit.registerNameCtr,
        ),
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
        CustomTextField(
          hintText: "E-mail",
          controller: cubit.registerEmailCtr,
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
        CustomTextField(
          controller:   cubit.cityCtr,
          suffixIcon: const Icon(
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
        const SizedBox(height: 20),
      ],
    );
  }
}
