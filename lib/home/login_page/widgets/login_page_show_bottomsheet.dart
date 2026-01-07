part of 'login_page_w_import.dart';

class LoginPageShowBottomsheet extends StatelessWidget {
  const LoginPageShowBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<CreateAccUserCubit, CreateAccUserState>(
      listener: (context, state) {
        // لو التسجيل نجح
        if (state is RegisterSuccess) {
          // عرض البوتوم شيت
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
            onTap: () async {
              if (isLoading) return;

              /// ✅ استدعاء إنشاء الحساب مع Token ديناميكي
              final token = await getToken(); // دالة تجيب Token صح

              if (token == null) {
                showToast(
                  text: "لا يمكن الحصول على رمز الدخول، سجل دخول أولاً",
                  state: ToastStates.error,
                );
                return;
              }

              cubit.createAcc(
                param: CreateAccUserParam(
                  fullName: cubit.fullNameCtrl.text,
                  email: cubit.emailCtrl.text,
                  city: cubit.dropDownVal ?? '',
                  name: '',
                  cityId: '',
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
                    "تسجيل الحساب",
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

  /// دالة وهمية تجيب Token صح
  /// ممكن تحط هنا أي طريقة تجيب الـ Token من Login أو SharedPreferences
  Future<String?> getToken() async {
    // مثال: لو مخزن Token في UserCubit
    // final userCubit = getIt<UserCubit>();
    // return userCubit.token;

    // حاليا رجع قيمة ثابتة للتجربة
    return "الصحيح_token_من_backend";
  }
}
