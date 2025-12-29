part of 'settings_app_w_imports.dart';
class SettingAppSupportFor extends StatelessWidget {
  const SettingAppSupportFor({super.key});

  @override
  Widget build(BuildContext context) {
    return    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 30),
          // ممكن تغير القيم حسب احتياجك
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              "دعم واستعلامات",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrivacyPolicy()),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SvgPicture.asset("assets/images/privacy.svg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "سياسة الخصوصية",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 175),
              Image.asset("assets/images/Vector (22).png"),
            ],
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TermsConditions()));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SvgPicture.asset("assets/images/contract.svg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "الأحكام والشروط",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 187),
              Image.asset("assets/images/Vector (22).png"),
            ],
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AboutComfortBox()));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SvgPicture.asset(
                  "assets/images/Comfort Logo.svg",
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "عن كمفورت بوكس",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 175),
              Image.asset("assets/images/Vector (22).png"),
            ],
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AskedQuestions()));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SvgPicture.asset("assets/images/faq.svg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "الأسئلة الشائعة",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 200),
              Image.asset("assets/images/Vector (22).png"),
            ],
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactUs()));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child:
                SvgPicture.asset("assets/images/customer (1).svg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "تواصل معنا",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 223),
              Image.asset("assets/images/Vector (22).png"),
            ],
          ),
        ),
      ],
    );
  }
}
