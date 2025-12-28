part of 'splash_screens_w_import.dart';

class SplashScreensButtonSheet extends StatelessWidget {
  const SplashScreensButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ShowModelScreen()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width ,
        height: 55.h, // لو معك flutter_screenutil
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: const Center(
          child: Text(
            "متابعة",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white, // خلي النص واضح على البرتقالي
            ),
          ),
        ),
      ),
    );
  }
}
