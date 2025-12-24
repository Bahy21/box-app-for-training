part of 'home_profile_setting_w_import.dart';

class HomeProfileSettingDetails extends StatelessWidget {
  const HomeProfileSettingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "الأسم كامل",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        CustomTextField(hintText: "Abdallrhman Fathy"),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "الايميل",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        CustomTextField(hintText: "abdallrhman@gmail.com"),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "رقم الجوال",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        CustomTextField(
          suffixIcon: Icon(
            Icons.lock,
            size: 20,
            color: Colors.black,
          ),
          hintText: "01002412682",
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "المدينة",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PointSettings(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                children: [
                  Text(
                    "الرياض",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/Vector (26).png',
                  ),
                ],
              ),
            )),
        SizedBox(height: 120),
      ],
    );
  }
}
