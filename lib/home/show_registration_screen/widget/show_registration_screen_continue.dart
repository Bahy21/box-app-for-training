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
                fontFamily: 'DINNextLTArabic', // 👈 الخط هنا
                fontWeight: FontWeight.w700,    // Medium

                fontSize: 20,
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
              fontFamily: 'DINNextLTArabic',

              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 10),

        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "أدخل رقم جوالك لتسجيل الدخول",
            style: TextStyle(
                fontFamily: 'DINNextLTArabic',
                fontWeight: FontWeight.w400,

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
              fontFamily: 'DINNextLTArabic',
              fontWeight: FontWeight.w700,

              fontSize: 23,
            ),
          ),
        ),
      ],
    );
  }
}
