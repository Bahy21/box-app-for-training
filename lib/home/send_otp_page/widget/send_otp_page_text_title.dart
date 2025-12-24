part of 'send_otp_page_w_import.dart';

class SendOtpPageTextTitle extends StatelessWidget {
  const SendOtpPageTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "التحقق من رقم الجوال!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "أدخل الكود المرسل إلى ",
            style: TextStyle(fontSize: 22),
          ),
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "+966 50 698 7856",
            style: TextStyle(fontSize: 22),
          ),
        ),
      ],
    );
  }
}
