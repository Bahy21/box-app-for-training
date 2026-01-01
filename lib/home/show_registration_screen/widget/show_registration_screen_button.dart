part of 'show_registration_screen_w_import.dart';

class ShowRegistrationScreenButton extends StatelessWidget {
  const ShowRegistrationScreenButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final bool isLoading =
            state is LoginTechLoading || state is LoginUserLoading;
        final cubit = BlocProvider.of<LoginCubit>(context);
        return AbsorbPointer(
          absorbing: isLoading,
          child: GestureDetector(
            onTap: isLoading ? null :()=>  cubit.login(context: context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: width,
                height: 55,
                decoration: BoxDecoration(
                  color: isLoading
                      ? Colors.orange.withValues(alpha: 0.6)
                      : Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
