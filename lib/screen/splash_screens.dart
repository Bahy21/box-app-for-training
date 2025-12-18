import 'package:boxapp/screen/show_modle_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(const Duration(milliseconds: 300));
    print("=================== after await ");
    showSheet(context);
  }



  void showSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        print("=================== inside build");
        return Container(
          height: 380,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // كل العناصر على اليمين
            children: [
              // العنوان
              // Text(
              //   "اختر اللغة المفضلة",
              //   style: GoogleFonts.hedvigLettersSans(),
              // ),

              const SizedBox(height: 30),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "English",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset("assets/images/united .svg", height: 25),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowModelScreen(),
                        ),
                      );
                    },
                    child: const Icon(Icons.circle_outlined),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              const Divider(),
              const SizedBox(height: 15),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "العربية",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset("assets/images/saudi.svg", height: 25),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowModelScreen(),
                        ),
                      );
                    },
                    child: const Icon(Icons.circle_outlined),
                  ),
                ],
              ),

              const Spacer(),

              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    "متابعة",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFE9c2D),
      body: GestureDetector(
        onTap: () => showSheet(context),
        child: Center(
          child: Image.asset(
            "assets/images/loeg.png",
          ),
        ),
      ),
    );
  }
}
