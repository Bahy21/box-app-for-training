part of 'send_otp_page_w_import.dart';

class SendOtpPageCircle extends StatelessWidget {
  const SendOtpPageCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          //show dialog
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child: Text(
                      "تم التحقق من رقم الجوال بنجاح ", style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),)),

                    actions: [
                      Center(child: Image.asset("assets/images/Frame.png")),
                      TextButton(onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScreenName(),
                          ),
                        );
                      }, child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade200,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Text(
                            " تم",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),),

                    ]
                    ,
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


    );
  }

  // ودجت TextField دائري
  //widget TextField
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




  }

