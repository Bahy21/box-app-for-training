part of 'send_otp_page_import.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  // OTP Box method
  Widget _otpBox() {
    return SizedBox(
      width: 75,
      height: 75,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75),
          ),
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            // text title
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
                "أدخل الكود المرسل إلى",
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
            const SizedBox(height: 40),
            // circle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _otpBox(),
                const SizedBox(width: 15),
                _otpBox(),
                const SizedBox(width: 15),
                _otpBox(),
                const SizedBox(width: 15),
                _otpBox(),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "إعادة إرسال الكود بعد",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Center(
                          child: Text(
                            "تم التحقق من رقم الجوال بنجاح",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        actions: [
                          Center(
                            child: Image.asset("assets/images/Frame.png"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ScreenName(),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade200,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Center(
                                child: Text(
                                  "تم",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "تحقق الآن",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
