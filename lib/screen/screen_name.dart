import 'package:boxapp/screen/nafth_page.dart';
import 'package:flutter/material.dart';
import '../custem_text_filed.dart';
import '../model_buttom.dart';

class ScreenName extends StatelessWidget {
  const ScreenName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //   automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان كبير
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "مرحباً بك من جديد",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "أدخل بياناتك لإنشاء حساب جديد",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // تسمية الحقل
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "الأسم كامل",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // حقل الاسم الأول محاذي لليمين
              const CustomTextField(hintText: "My name"),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "البريد الاكتوني",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hintText: "E-mail",
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "المدينة",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const CustomTextField(
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 20,
                  color: Colors.black,
                ),
                hintText: "City",
              ),
              const SizedBox(
                height: 150,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "من خلال إنشاء حساب فإنك توافق على الشروط والأحكام و سياسة الخصوصية",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: CustomOrangeButton(
                  text: "إنشاء حساب",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
