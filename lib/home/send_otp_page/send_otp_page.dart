import 'package:flutter/material.dart';

import '../login_page/login_page_import.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  // FocusNodes لكل مربع OTP
  final _focus1 = FocusNode();
  final _focus2 = FocusNode();
  final _focus3 = FocusNode();
  final _focus4 = FocusNode();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _focus1.dispose();
    _focus2.dispose();
    _focus3.dispose();
    _focus4.dispose();
    super.dispose();
  }

  Widget _otpBox(TextEditingController ctrl, FocusNode currentFocus,
      FocusNode? nextFocus, double size) {
    return SizedBox(
      width: size,
      height: size,
      child: TextField(
        controller: ctrl,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: size * 0.35, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            currentFocus.unfocus();
            if (nextFocus != null)
              FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final otpSize = width * 0.18; // حجم مربع OTP نسبة للشاشة

    return Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.08),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "التحقق من رقم الجوال!",
                style: TextStyle(
                    fontSize: width * 0.06, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.01),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أدخل الكود المرسل إلى",
                style: TextStyle(fontSize: width * 0.05),
              ),
            ),
            SizedBox(height: height * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "+966 50 698 7856",
                style: TextStyle(fontSize: width * 0.05),
              ),
            ),
            SizedBox(height: height * 0.05),
            // Row للمربعات مع التنقل التلقائي
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _otpBox(_controller1, _focus1, _focus2, otpSize),
                SizedBox(width: width * 0.03),
                _otpBox(_controller2, _focus2, _focus3, otpSize),
                SizedBox(width: width * 0.03),
                _otpBox(_controller3, _focus3, _focus4, otpSize),
                SizedBox(width: width * 0.03),
                _otpBox(_controller4, _focus4, null, otpSize),
              ],
            ),
            SizedBox(height: height * 0.02),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "إعادة إرسال الكود بعد",
                style:
                    TextStyle(fontSize: width * 0.045, color: Colors.black54),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: SizedBox(
                width: width,
                height: height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              "تم التحقق من رقم الجوال بنجاح",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          actions: [
                            Center(
                              child: Image.asset("assets/images/Frame.png"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ScreenName()));
                              },
                              child: Container(
                                width: width,
                                height: height * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Center(
                                  child: Text(
                                    "تم",
                                    style: TextStyle(
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
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
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "تحقق الآن",
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
