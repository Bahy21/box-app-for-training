part of 'login_page_w_import.dart';

/*
class LoginPageShowBottomsheet extends StatelessWidget {
  const LoginPageShowBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return BlocConsumer<CreateAccUserCubit, CreateAccUserState>(
      listener: (context, state) {
      //  final user = context.read<UserCubit>();

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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
                              builder: (_) => const NafathPage(),
                            ),
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
        final cubit = context.read<CreateAccUserCubit>();

        return AbsorbPointer(
          absorbing: isLoading,
          child: GestureDetector(
            onTap: () {
              if (isLoading) return;
              var token =  context.read<UserCubit>().token;
              if(token ==null || token.isEmpty == true) return ;
              cubit.createAcc(
                param: CreateAccUserParam(
                  fullName: cubit.fullNameCtrl.text,
                  email: cubit.registerEmailCtr.text,
                  city: cubit.dropDownVal ?? '',
                  name: cubit.registerNameCtr.text,
                  cityId: cubit.cityCtr.text,
                ),
                context: context,
                token: token,
              );
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
                    "إنشاء حساب",
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
  final CreateAccUserCubit cubit;
   LoginPageShowBottomsheet({super.key, required this.cubit});

//      arguments: SelectLocationArg(cityId: cityId),
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return BlocConsumer<CreateAccUserCubit, CreateAccUserState>(
      listener: (context, state) {
        if (!context.mounted) return;

        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => BlocProvider<SelectLocationCubit>(
                create: (context) => getIt<SelectLocationCubit>(),
                child: SelectLocationView(
                  argument: SelectLocationArgument(
                    serviceId: '', // ضع أي قيمة مناسبة
                  ),
                ),
              ),
            ),
          );
        } else if (state is CreateAccFailure) {}
      },
      builder: (context, state) {
        final bool isLoading = state is CreateAccLoading;
        return AbsorbPointer(
          absorbing: isLoading,
          child: GestureDetector(
            onTap: () {
              if (isLoading) return;

              if (cubit.fullNameCtrl.text.isEmpty ||
                  cubit.registerEmailCtr.text.isEmpty ||
                  cubit.registerNameCtr.text.isEmpty ||
                  cubit.dropDownVal == null ||
                  cubit.cityCtr.text.isEmpty) {}

              var token = context.read<UserCubit>().token;
              if (token == null || token.isEmpty) return;

              cubit.createAcc(
                param: CreateAccUserParam(
                  fullName: cubit.fullNameCtrl.text,
                  email: cubit.registerEmailCtr.text,
                  city: cubit.dropDownVal ?? '',
                  name: cubit.registerNameCtr.text,
                  cityId: cubit.dropDownVal ?? "",
                ),
                context: context,
                token: token,
              );
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
                          "إنشاء حساب",
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
