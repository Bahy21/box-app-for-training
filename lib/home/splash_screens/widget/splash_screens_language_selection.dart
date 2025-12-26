part of 'splash_screens_w_import.dart';

class SplashScreensLanguageSelection extends StatelessWidget {
  const SplashScreensLanguageSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "اختر اللغة المفضلة",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "English",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset("assets/images/united .svg", height: 25),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowModelScreen()
                  ),
                );
              },
              child: const Icon(Icons.circle_outlined),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "العربية",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset("assets/images/saudi.svg", height: 25),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowModelScreen(),
                  ),
                );
              },
              child: const Icon(Icons.circle_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
