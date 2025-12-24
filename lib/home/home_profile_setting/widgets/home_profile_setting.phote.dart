part of 'home_profile_setting_w_import.dart';
class HomeProfileSettingPhoto extends StatelessWidget {
  const HomeProfileSettingPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey[300],
          // backgroundImage: AssetImage('assets/images/wallet.svg'), // أو NetworkImage
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.camera_alt,
              size: 18,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
