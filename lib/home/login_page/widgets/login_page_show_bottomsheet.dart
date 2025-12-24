part of 'login_page_w_import.dart';
class LoginPageShowBottomsheet extends StatelessWidget {
  const LoginPageShowBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      child: CustomOrangeButton(
        text: "إنشاء حساب",
        //bottom sheet
        onTap: () {
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
                width: double.infinity,
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
                      Center(
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
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
