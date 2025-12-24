part of 'splash_screens_w_import.dart';
class SplashScreensButtonSheet extends StatelessWidget {
  const SplashScreensButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.orange.shade200,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Center(
        child: Text(
          "متابعة",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
