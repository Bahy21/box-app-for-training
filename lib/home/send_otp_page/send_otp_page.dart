import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_verify_code/active_acc_param.dart';
import '../../api_verify_code/pin_code_cubit/pin_code_cubit.dart';
import '../../api_verify_code/pin_code_cubit/user_cubit.dart';
import '../../core/di/di.dart';
import '../../core/util/extensions/navigation.dart';
import '../../core/util/routing/routes.dart';
import '../Register/login_page_import.dart';

class NextPage extends StatefulWidget {
  final String phone;
  const NextPage({super.key, required this.phone});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

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

  String get otp =>
      "${_controller1.text}${_controller2.text}${_controller3.text}${_controller4.text}";

  Widget _otpBox(
      TextEditingController ctrl,
      FocusNode currentFocus,
      FocusNode? nextFocus,
      FocusNode? previousFocus,
      double size,
      ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // اللون الداخلي
        shape: BoxShape.circle,       // شكل دائري كامل
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: ctrl,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: size * 0.35, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "", // إخفاء العداد
          border: InputBorder.none, // إزالة أي بوردر
        ),
        onChanged: (value) {
          if (value.length == 1) {
            currentFocus.unfocus();
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            }
          }

          if (value.isEmpty && previousFocus != null) {
            FocusScope.of(context).requestFocus(previousFocus);
          }
        },
      ),
    );
  }

  void _showSuccessDialog() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: width * 0.3,
            height: height * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "تم التحقق من رقم الجوال بنجاح",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/images/Frame.png",
                    height: height * 0.12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Register()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "تم",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final otpSize = width * 0.18;

    return BlocProvider(
      create: (context) => getIt<PinCodeCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,

          automaticallyImplyLeading: true,
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
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
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
                  widget.phone,
                  style: TextStyle(fontSize: width * 0.05),
                ),
              ),
              SizedBox(height: height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _otpBox(_controller1, _focus1, _focus2, null, otpSize),
                  SizedBox(width: width * 0.03),
                  _otpBox(_controller2, _focus2, _focus3, _focus1, otpSize),
                  SizedBox(width: width * 0.03),
                  _otpBox(_controller3, _focus3, _focus4, _focus2, otpSize),
                  SizedBox(width: width * 0.03),
                  _otpBox(_controller4, _focus4, null, _focus3, otpSize),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: BlocConsumer<PinCodeCubit, PinCodeState>(
                  listener: (context, state) {
                    if (state is PinCodeSuccess) {
                      _showSuccessDialog();
                    } else if (state is FirstLoginSuccess) {
                      getIt<UserCubit>().updateToken(state.token).then((_) {
                        context.pushWithNamed(Routes.createAccUserView);
                      });
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<PinCodeCubit>();
                    final isLoading =
                        state is PinCodeLoading || state is ResendCodeLoading;

                    return SizedBox(
                      width: width,
                      height: height * 0.06,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                          cubit.activeAcc(
                            context: context,
                            isUser: true,
                            param: ActiveAccParameter(
                              code: otp,
                              phone: widget.phone,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        )
                            : Text(
                          "تحقق الآن",
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
