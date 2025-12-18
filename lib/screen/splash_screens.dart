import 'package:boxapp/screen/show_modle_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 120), () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 380,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // كل العناصر على اليمين
              children: [
                // العنوان
                Text(
                  "اختر اللغة المفضلة",
                  style: GoogleFonts.hedvigLettersSans(),
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "English",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset("assets/images/united .svg", height: 25),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowModelScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.circle_outlined),
                    ),                  ],
                ),

                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "العربية",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset("assets/images/saudi.svg", height: 25),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowModelScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.circle_outlined),
                    ),


                  ],
                ),

                Spacer(),

                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFE9c2D),
      body: Center(
        child: Image.asset(
          "assets/images/loeg.png",
        ),
      ),
    );
  }
}