part of 'login_page_import.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  @override
  void initState() {
    context.read<CreateAccUserCubit>().fetchCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateAccUserCubit>(
      create: (_) => getIt<CreateAccUserCubit>(),
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
