part of 'contact_us_import.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/right-arrow.png",
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "تواصل معنا",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final h = constraints.maxHeight;
          final w = constraints.maxWidth;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.05, // ≈ 20
                vertical: h * 0.025, // ≈ 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "يرجى إدخال بياناتك بالأسفل للتواصل معنا",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.03),

                  // الاسم كامل
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الأسم كامل",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.012),
                  const CustomTextField(hintText: "الأسم كامل"),

                  SizedBox(height: h * 0.03),

                  // البريد الإلكتروني
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "البريد الاكتوني",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.012),
                  const CustomTextField(
                    hintText: "البريد الاكتوني",
                  ),

                  SizedBox(height: h * 0.03),

                  // الفئة
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الفئة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.012),
                  const CustomTextField(
                    hintText: "الفئة",
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: h * 0.03),

                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "نص الاقتراح / الشكوى",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: h * 0.02),

                  MessageTextField(),
                  SizedBox(height: h * 0.03),

                  ContactUsButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
