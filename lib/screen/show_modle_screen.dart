import 'package:boxapp/screen/nextpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../custem_text_filed.dart';
import '../model_buttom.dart';

class ShowModelScreen extends StatefulWidget {
  const ShowModelScreen({super.key});

  @override
  State<ShowModelScreen> createState() => _ShowModelScreenState();
}

class _ShowModelScreenState extends State<ShowModelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView( // لو الصفحة أطول من الشاشة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),

              // Row الصورة والنص على نفس السطر
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "المتابعة كزائر",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/Comfort Logo.svg",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),

              const SizedBox(height: 50),

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
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "رقم الجوال",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const CustomTextField(
                hintText: "099",
              ),

              const SizedBox(height: 150),

              CustomOrangeButton(
                text: "تسجيل الدخول",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NextPage()),
                  );
                },
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
