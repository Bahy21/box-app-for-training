part of 'login_page_w_import.dart';
/*
class ShowRegistrationScreenButton extends StatelessWidget {
  const ShowRegistrationScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<CreateAccUserCubit, CreateAccUserState>(
      builder: (context, state) {
        final bool isLoading =
            state is CreateAccLoading || state is SaveDataFailure;
        final cubit = context.read<CreateAccUserCubit>();

        return AbsorbPointer(
          absorbing: isLoading,
          child: GestureDetector(
            onTap: () async {
              if (isLoading) return;

              // استدعي الدالة اللي بتعمل login
              final success = await cubit.login(context: context);

              // لو تسجيل الدخول ناجح نعرض البوتوم شيت
              if (success) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  builder: (context) {
                    return Container(
                      height: 400,
                      padding: const EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Center(
                              child:
                              Image.asset("assets/images/Frame 2.png"),
                            ),
                            const SizedBox(height: 20),
                            const Center(
                              child: Text(
                                "وثق حسابك عبر النفاذ الوطني",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                "يجب عليك استكمال عملية التسجيل حتى يمكنك استخدام هذه الخدمة.",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 50),
                            CustomOrangeButton(
                              text: "التحقق من نفاذ",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const NafathPage()),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: width,
                height: 55,
                decoration: BoxDecoration(
                  color: isLoading
                      ? Colors.orange.withOpacity(0.6)
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

 */
class LoginPageShowBottomsheet extends StatelessWidget {
  const LoginPageShowBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<CreateAccUserCubit, CreateAccUserState>(
      listener: (context, state) async {
        // تأكد إن الـ widget لسه موجودة قبل استخدام context
        if (!context.mounted) return;

        if (state is RegisterSuccess) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            builder: (context) {
              return Container(
                height: 400,
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Image.asset("assets/images/Frame 2.png"),
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          "وثق حسابك عبر النفاذ الوطني",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "يجب عليك استكمال عملية التسجيل حتى يمكنك استخدام هذه الخدمة.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 50),
                      CustomOrangeButton(
                        text: "التحقق من نفاذ",
                        onTap: () {
                          if (!context.mounted) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const NafathPage()),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        final bool isLoading = state is CreateAccLoading;

        return AbsorbPointer(
          absorbing: isLoading,
          child: GestureDetector(
            onTap: () {
              if (isLoading) return;

              final cubit = context.read<CreateAccUserCubit>();

              if (cubit.formKey.currentState?.validate() ?? false) {
                cubit.createAcc(
                  param: CreateAccUserParam(
                    fullName: cubit.fullNameCtrl.text,
                    email: cubit.emailCtrl.text,
                    city: cubit.dropDownVal ?? '',
                    name: '',
                    cityId: '',
                  ),
                  context: context,
                  token: 'user-token',
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: width,
                height: 55,
                decoration: BoxDecoration(
                  color: isLoading
                      ? Colors.orange.withOpacity(0.6)
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
                    "إنشاء الحساب",
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
