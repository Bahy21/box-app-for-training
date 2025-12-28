part of 'splash_screens_w_import.dart';

class SplashScreensLanguageSelection extends StatefulWidget {
  const SplashScreensLanguageSelection({super.key});

  @override
  State<SplashScreensLanguageSelection> createState() =>
      _SplashScreensLanguageSelectionState();
}

class _SplashScreensLanguageSelectionState
    extends State<SplashScreensLanguageSelection> {
  // اللغة المختارة
  String selectedLang = 'en'; // 'en' أو 'ar'

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اختر اللغة المفضلة",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h),

          // English
          _languageItem(
            title: "English",
            flag: "assets/images/united .svg",
            isSelected: selectedLang == 'en',
            onTap: () {
              setState(() {
                selectedLang = 'en';
              });
            },
            iconToNameSpacing: 12.w,    // المسافة بين الدائرة والاسم
            nameToFlagSpacing: 18.w,     // المسافة بين الاسم والصورة للإنجليزي
          ),

          SizedBox(height: 15.h),
          Divider(thickness: 1.h),
          SizedBox(height: 15.h),

          // Arabic
          _languageItem(
            title: "العربية",
            flag: "assets/images/saudi.svg",
            isSelected: selectedLang == 'ar',
            onTap: () {
              setState(() {
                selectedLang = 'ar';
              });
            },
            iconToNameSpacing: 10.w,    // المسافة بين الدائرة والاسم
            nameToFlagSpacing: 35.w,     // المسافة بين الاسم والصورة للعربية
          ),
        ],
      ),
    );
  }

  /// Widget واحد للغتين مع تحكم كامل في المسافات
  Widget _languageItem({
    required String title,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
    double iconToNameSpacing = 8,   // المسافة بين الدائرة والاسم
    double nameToFlagSpacing = 10,   // المسافة بين الاسم والصورة
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_off,
            size: 22.sp,
            color: isSelected ? Colors.orange : Colors.grey,
          ),
          SizedBox(width: iconToNameSpacing), // المسافة بين الدائرة والاسم
          Text(
            title,
            style: TextStyle(fontSize: 18.sp),
          ),
          SizedBox(width: nameToFlagSpacing), // المسافة بين الاسم والصورة
          SvgPicture.asset(
            flag,
            height: 25.h,
            width: 25.w,
          ),
        ],
      ),
    );
  }
}
