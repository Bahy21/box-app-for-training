part of 'home_point_details_w_imports.dart';

class HomePointDetailsPointDetails extends StatelessWidget {
  const HomePointDetailsPointDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "تفاصيل النقاط",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/Comfort Logo.svg",
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "طلب رقم 569877",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "4 يوليو، 2026",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    "+20 نقطة",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
