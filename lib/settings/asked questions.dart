import 'package:flutter/material.dart';

class AskedQuestions extends StatelessWidget {
  const AskedQuestions ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/right-arrow.png",
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "الأسئلة الشائعة",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    " لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم؟",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: 20),
                Image.asset("assets/images/Vector (27).png"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت …"
                  "وعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي.",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
              softWrap: true,
              style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Divider تحت كل المحتوى
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            Row(children: [
              Text("لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
              SizedBox(width: 50),
              Image.asset("assets/images/Vector (26).png"),
            ],),
            SizedBox(height: 30),
            Row(children: [
              Text("لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
              SizedBox(width: 50),
              Image.asset("assets/images/Vector (26).png"),
            ],),
            SizedBox(height: 30),
            Row(children: [
              Text("لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
              SizedBox(width: 50),
              Image.asset("assets/images/Vector (26).png"),
            ],),
            SizedBox(height: 30),
            Row(children: [
              Text("لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم؟",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
              SizedBox(width: 50),
              Image.asset("assets/images/Vector (26).png"),
            ],),


          ],
        ),
      ),
    );
  }
}
