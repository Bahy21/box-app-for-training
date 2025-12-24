part of 'home_profile_setting_import.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar profile
      appBar: HomeProfileSettingAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child:
              //photo profile
              HomeProfileSettingPhoto(),
            ),
            SizedBox(height: 20),
            //profile details
            HomeProfileSettingDetails(),
            //save change
            HomeProfileSettingSaveChange(),
          ],
        ),
      ),
    );
  }
}
