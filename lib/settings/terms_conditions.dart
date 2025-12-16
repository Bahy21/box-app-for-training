
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions ({super.key});

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
              "الشروط والأحكام",
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
          children: const [
            Text(
              "الشروط والأحكام",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 20),
            Text(
              "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت …"

                  "وعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي.",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.start,
              softWrap: true,
              style: TextStyle(fontSize: 14, height: 1.5,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
