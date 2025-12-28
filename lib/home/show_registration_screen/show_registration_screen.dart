
part of 'show_registration_screen_import.dart';

class ShowModelScreen extends StatefulWidget {
  const ShowModelScreen({super.key});

  @override
  State<ShowModelScreen> createState() => _ShowModelScreenState();
}

class _ShowModelScreenState extends State<ShowModelScreen> {
  final TextEditingController phoneController = TextEditingController();
//  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    const ShowRegistrationScreenContinue(),

                    const SizedBox(height: 20),
                    ShowRegistrationScreenTextFiled(
                      hintText: ' 05 *** **** ',
                    ),
                    const SizedBox(height: 150),

                    ShowRegistrationScreenButton(),
                    const SizedBox(height: 10),
                  ],
                ),
              )),

         );
  }
}



/*
part of 'show_registration_screen_import.dart';

class ShowModelScreen extends StatefulWidget {
  const ShowModelScreen({super.key});

  @override
  State<ShowModelScreen> createState() => _ShowModelScreenState();
}

class _ShowModelScreenState extends State<ShowModelScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // لو تسجيل الدخول ناجح نروح للصفحة التالية
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NextPage()),
            );
          } else if (state is LoginError) {
            // لو حصل خطأ نعرضه في SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          // ربط الـ controller بالكيوبيت لو محتاج تبعت البيانات
          cubit.phoneController.text = phoneController.text;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 60),
                    const ShowRegistrationScreenContinue(),
                    const SizedBox(height: 20),

                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: '**********',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 150),

                    if (state is LoginLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      CustomOrangeButton(
                        text: "تسجيل الدخول",
                        onTap: () {
                          cubit.login(); // هنا نستدعي الفنكشن اللي في cubit
                        },
                      ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

 */

/*
part of 'show_registration_screen_import.dart';
class ShowModelScreen extends StatefulWidget {
  const ShowModelScreen({super.key});

  @override
  State<ShowModelScreen> createState() => _ShowModelScreenState();
}

class _ShowModelScreenState extends State<ShowModelScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyCubit(
        MyRepo(
          webServices: WebServices(Dio()),
        ),
      ),
      child: BlocListener<MyCubit, MyState>(
        listener: (context, state) {
          if (state is CreateUserSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NextPage()),
            );
          } else if (state is CreateUserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "رقم الهاتف",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<MyCubit, MyState>(
                  builder: (context, state) {
                    final isLoading = state is CreateUserLoading;

                    return GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                        context.read<MyCubit>().createUser(
                          phone: phoneController.text.trim(),
                          password: 'dummy_password',
                        );
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                          isLoading ? Colors.grey : Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isLoading
                              ? "جاري التحميل..."
                              : "تسجيل الدخول",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// صفحة بعد النجاح
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "نجح تسجيل الدخول!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

 */
/// صفحة بعد النجاح
