part of 'show_registration_screen_w_import.dart';

class ShowRegistrationScreenContinue extends StatelessWidget {
  const ShowRegistrationScreenContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/images/Comfort Logo.svg",
              width: 60,
              height: 60,
            ),

            const Text(
              "المتابعة كزائر",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // نص مرحباً بك على اليمين
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "مرحباً بك!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "أدخل رقم جوالك لتسجيل الدخول",
            style: TextStyle(
              fontSize:22 ,
              color: Colors.grey

            ),
          ),
        ),
     SizedBox(height: 50,),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "رقم الجوال",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
