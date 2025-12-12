import 'package:boxapp/custem_text_filed.dart';
import 'package:boxapp/screen/gps.dart';
import 'package:flutter/material.dart';

import '../model_buttom.dart';

class NafathPage extends StatelessWidget {
  const NafathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // صورة في المنتصف
                Center(
                  child: Image.asset("assets/images/Frame 2.png"),
                ),

                const SizedBox(height: 20),

                // العنوان
                const Text(
                  "وثق حسابك عبر النفاذ الوطني",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "يجب عليك استكمال عملية التسجيل حتى يمكنك استخدام هذه الخدمة.",
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 50),

                // تسمية حقل الهوية
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "رقم الهوية",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // TextField مع prefixIconPath
                CustomTextField(
                  hintText: "أدخل رقم الهوية",
                  suffixIconPath:"assets/images/shield.png" ,
                ),
                SizedBox(height: 130),
                CustomOrangeButton(
                  text: "التحقق من نفاذ",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gps()),
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
