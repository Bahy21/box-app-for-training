import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/select_location/presentation/args/select_location_arg.dart';
import '../home/select_location/presentation/view/select_location_view.dart';
import '../home/send_otp_page/send_otp_page.dart';
import '../home/show_registration_screen/show_registration_screen_import.dart';

class HomeSplashScreen extends StatefulWidget {
  const HomeSplashScreen({super.key});

  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _showBottomSheet = false; // للتحكم في ظهور البوتوم شيت

  @override
  void initState() {
    super.initState();

    // AnimationController لمدة 3 ثواني
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Animation من 0.5 إلى 2.0 (تكبير تدريجي)
    _scaleAnimation = Tween<double>(begin: 0.5, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward(); // بدء الانميشن

    // بعد انتهاء الانميشن، أظهر Bottom Sheet وحرك الصورة للأعلى
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showBottomSheet = true; // حرك الصورة للأعلى
        });
        Future.delayed(const Duration(milliseconds: 150), () {
          _showLanguageBottomSheet();
        });
      }
    });
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SplashScreensLanguageSelection(),
              const Spacer(),
              const SplashScreensButtonSheet(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFE9c2D),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: _showBottomSheet
                ? Alignment(0, -0.6) // الصورة ترتفع للأعلى
                : Alignment.center, // منتصف الشاشة قبل ظهور البوتوم شيت
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/images/loeg.png",
                height: 120.h,
                width: 120.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --------- مثال لاختيار اللغة --------- //

class SplashScreensLanguageSelection extends StatefulWidget {
  const SplashScreensLanguageSelection({super.key});

  @override
  State<SplashScreensLanguageSelection> createState() =>
      _SplashScreensLanguageSelectionState();
}

class _SplashScreensLanguageSelectionState
    extends State<SplashScreensLanguageSelection> {
  String selectedLang = 'en';

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
              fontFamily: 'DINNextLTArabic', // 👈 الخط هنا

              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h),
          _languageItem(
            flag: "assets/images/united .svg",

            title: "English",
            isSelected: selectedLang == 'en',
            onTap: () {
              setState(() {
                selectedLang = 'en';
              });
            },
            iconToNameSpacing: 12.w,
            nameToFlagSpacing: 18.w,
          ),
          SizedBox(height: 15.h),
          Divider(thickness: 1.h),
          SizedBox(height: 15.h),
          _languageItem(
            flag: "assets/images/saudi.svg",
            title: "العربية",
            isSelected: selectedLang == 'ar',
            onTap: () {
              setState(() {
                selectedLang = 'ar';
              });
            },
            iconToNameSpacing: 10.w,
            nameToFlagSpacing: 35.w,
          ),
        ],
      ),
    );
  }

  Widget _languageItem({
    required String title,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
    double iconToNameSpacing = 8,
    double nameToFlagSpacing = 10,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked_outlined : Icons.radio_button_off,
            size: 22.sp,
            color: isSelected ? Colors.orange : Colors.grey,
          ),
          SizedBox(width: 20.sp,),

          SvgPicture.asset(
            flag,
            height: 25.h,
            width: 25.w,
          ),
        SizedBox(width: 10.sp,),
        //  SizedBox(width: nameToFlagSpacing),
          SizedBox(width: iconToNameSpacing),


          Text(
            title,
            style: TextStyle(
              fontFamily: 'DINNextLTArabic', // 👈 الخط هنا

              fontSize: 18.sp,fontWeight: FontWeight.w700,

            ),
          ),

        ],
      ),
    );
  }
}

class SplashScreensButtonSheet extends StatelessWidget {
  const SplashScreensButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ShowModelScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: width,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              "متابعه",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home/send_otp_page/send_otp_page.dart';
import '../home/show_registration_screen/show_registration_screen_import.dart';

class HomeSplashScreen extends StatefulWidget {
  const HomeSplashScreen({super.key});

  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _showBottomSheet = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _showBottomSheet = true;
        });
        Future.delayed(const Duration(milliseconds: 150), () {
          _showLanguageBottomSheet();
        });
      }
    });
  }

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SplashScreensLanguageSelection(),
              const Spacer(),
              const SplashScreensButtonSheet(),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFE9c2D),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: _showBottomSheet
                ? const Alignment(0, -0.6)
                : Alignment.center,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                "assets/images/loeg.png",
                height: 120.h,
                width: 120.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --------- اختيار اللغة --------- //

class SplashScreensLanguageSelection extends StatefulWidget {
  const SplashScreensLanguageSelection({super.key});

  @override
  State<SplashScreensLanguageSelection> createState() =>
      _SplashScreensLanguageSelectionState();
}

class _SplashScreensLanguageSelectionState
    extends State<SplashScreensLanguageSelection> {
  String selectedLang = 'en';

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
              fontSize: 21.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h),
          _languageItem(
            flag: "assets/images/united.svg",
            title: "English",
            isSelected: selectedLang == 'en',
            onTap: () {
              setState(() {
                selectedLang = 'en';
              });
            },
          ),
          SizedBox(height: 15.h),
          Divider(thickness: 1.h),
          SizedBox(height: 15.h),
          _languageItem(
            flag: "assets/images/saudi.svg",
            title: "العربية",
            isSelected: selectedLang == 'ar',
            onTap: () {
              setState(() {
                selectedLang = 'ar';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _languageItem({
    required String title,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
    double flagToNameSpacing = 12,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // الصورة أولًا

          SvgPicture.asset(
            flag,
            height: 25.h,
            width: 25.w,
          ),
          SizedBox(width: flagToNameSpacing),

          // اسم اللغة
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          // الدائرة البرتقالية مع الداخل الأبيض
          Container(
            height: 22.sp,
            width: 22.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.orange,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                height: 10.sp,
                width: 10.sp,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange,
                ),
              ),
            )
                : null,
          ),
        ],
      ),
    );
  }
}

// --------- زر المتابعة --------- //

class SplashScreensButtonSheet extends StatelessWidget {
  const SplashScreensButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ShowModelScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: width,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              "متابعة",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

 */
