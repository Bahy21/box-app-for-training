part of 'show_registration_screen_import.dart';

class ShowModelScreen extends StatelessWidget {
  const ShowModelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = context.read<LoginCubit>();
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
                      hintText: '05 *** ****',
                      controller: cubit.phoneCtrl.controller,
                    ),
                    const SizedBox(height: 150),
                    ShowRegistrationScreenButton(
                      onTap: () {
                        cubit.login(context: context);
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
