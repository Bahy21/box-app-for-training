part of 'terms_conditions_settings_import.dart';


class TermsConditions extends StatelessWidget {
  const TermsConditions ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar condition
      appBar: TermsConditionsSettingsAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: const [
            //title text
            TermsConditionsSettingsTitleText(),
            SizedBox(height: 20),
            // text condition
            TermsConditionsSettingsTextCondition(),
          ],
        ),
      ),
    );
  }
}
