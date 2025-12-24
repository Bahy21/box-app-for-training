part of 'terms_conditions_settings_w_import.dart';
class TermsConditionsSettingsTitleText extends StatelessWidget {
  const TermsConditionsSettingsTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "الشروط والأحكام",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      textAlign: TextAlign.right,
    );
  }
}
