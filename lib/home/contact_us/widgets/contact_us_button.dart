part of 'contact_us_w_import.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return

     Container(
        width: MediaQuery.of(context).size.width ,
        height: 55.h,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: const Center(
          child: Text(
            "ارسال",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

    );
  }
}
