part of 'send_otp_page_w_import.dart';
class SendOtpPageCircle extends StatefulWidget {
  const SendOtpPageCircle({super.key});

  @override
  State<SendOtpPageCircle> createState() => _SendOtpPageCircleState();
}

class _SendOtpPageCircleState extends State<SendOtpPageCircle> {
  // Controllers لكل مربع OTP
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

  Widget _otpBox(TextEditingController ctrl, FocusNode currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: 75,
      height: 75,
      child: TextField(
        controller: ctrl,
        focusNode: currentFocus,
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
        onChanged: (value) {
          if (value.isNotEmpty) {
            currentFocus.unfocus();
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocProvider<PinCodeCubit>(
      create: (context) => PinCodeCubit(
        context.read(), // repository
        context.read(), // settingRepository
        context.read(), // userAuth
      ),
      child: BlocConsumer<PinCodeCubit, PinCodeState>(
        listener: (context, state) {
          if (state is PinCodeSuccess) {
            // تم التحقق بنجاح
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Center(child: Text("تم التحقق من رقم الجوال بنجاح")),
                actions: [
                  Center(child: Image.asset("assets/images/Frame.png")),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // اغلق الدايالوج
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is PinCodeFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("فشل التحقق من الرقم")),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<PinCodeCubit>();
          final isLoading = state is PinCodeLoading;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpBox(_controller1, _focus1, _focus2),
                  const SizedBox(width: 15),
                  _otpBox(_controller2, _focus2, _focus3),
                  const SizedBox(width: 15),
                  _otpBox(_controller3, _focus3, _focus4),
                  const SizedBox(width: 15),
                  _otpBox(_controller4, _focus4, null),
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
                  onPressed: isLoading
                      ? null
                      : () {
                    final otp = _controller1.text +
                        _controller2.text +
                        _controller3.text +
                        _controller4.text;

                    cubit.activeAcc(
                      context: context,
                      isUser: true,
                      param: ActiveAccParameter(
                        code: otp,
                        phone:LocaleKeys.phoneNumber, // هنا لازم تحط الرقم اللي المستخدم دخله
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    "تحقق الآن",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          );
        },
      ),
    );
  }
}
