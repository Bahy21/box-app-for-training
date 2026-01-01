part of 'show_registration_screen_import.dart';

class ShowModelScreen extends StatelessWidget {
  const ShowModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
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

                /// مربوط بالـ phoneCtrl داخل الكيوبت
                const ShowRegistrationScreenTextFiled(
                  hintText: '05 *** ****',
                ),

                const SizedBox(height: 150),

                /// زر تسجيل الدخول
                ShowRegistrationScreenButton(
                  onTap: () {
                    context.read<LoginCubit>().login(
                      context: context,
                    );
                  },
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
