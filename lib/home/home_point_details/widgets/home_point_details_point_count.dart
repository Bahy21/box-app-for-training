part of 'home_point_details_w_imports.dart';
class HomePointDetailsPointCount extends StatelessWidget {
  const HomePointDetailsPointCount({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/Vector (25).png",
          width: 60,
          height: 60,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "500 نقطة",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "500 نقاط تنتهي صلاحيتها في 28 أكتوبر 2026",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
