part of 'asked questions_setting_w_import.dart';
class AskedQuestionSettingsTerms extends StatelessWidget {
  const AskedQuestionSettingsTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Text(
      "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت …"
          "وعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي.",
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      softWrap: true,
      style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.bold),
    );
  }
}
