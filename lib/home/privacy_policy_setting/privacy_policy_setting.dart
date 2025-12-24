part of 'privacy_policy_setting_import.dart';


class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //app bar
      appBar: PrivacyPolicySettingAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            //title
            PrivacyPolicySettingTitle(),
            SizedBox(height: 20),
            //text title
            PrivacyPolicySettingTitleText(),
          ],
        ),
      ),
    );
  }
}
