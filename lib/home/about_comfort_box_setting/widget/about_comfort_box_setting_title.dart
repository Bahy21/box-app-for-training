part of 'about_comfort_box_setting_w_import.dart';
class AboutComfortBoxSettingTitle extends StatelessWidget {
  const AboutComfortBoxSettingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        " من نحن؟",
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
    );
  }
}
