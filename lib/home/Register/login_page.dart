part of 'login_page_import.dart';
/*
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateAccUserCubit>(
      create: (_) => getIt<CreateAccUserCubit>()..fetchCities(),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: LoginPageAppBar(),

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginPageTextTitle(),
                SizedBox(height: 30),
                LoginPageScreen(),
                SizedBox(height: 20),
                LoginPageShowBottomsheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 */

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) => getIt<UserCubit>(), // UserCubit موجود للصفحة كلها
        ),
        BlocProvider<CreateAccUserCubit>(
          create: (context) => getIt<CreateAccUserCubit>()..fetchCities(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: const LoginPageAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LoginPageTextTitle(),
                SizedBox(height: 30),
                LoginPageScreen(),
                SizedBox(height: 20),
                LoginPageShowBottomsheet(), // الزر موجود هنا
              ],
            ),
          ),
        ),
      ),
    );
  }
}
