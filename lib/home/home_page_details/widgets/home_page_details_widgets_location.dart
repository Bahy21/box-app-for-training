part of 'home_page_details_w_imports.dart';
class HomePageDetailsWidgetsLocation extends StatelessWidget {
  const HomePageDetailsWidgetsLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/Vector (5).png',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Text(
          "موقعك غير مفعّل",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            'assets/images/Vector (7).png',
          ),
        ),
      ],
    );
  }
}
