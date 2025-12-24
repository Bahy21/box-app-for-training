part of 'about_comfort_box_setting_import.dart';


class AboutComfortBox extends StatelessWidget {
  const AboutComfortBox ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AboutComfortBoxSettingAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: const [
            //title
            AboutComfortBoxSettingTitle(),
          ],
        ),
      ),
    );
  }
}
