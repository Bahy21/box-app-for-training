
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_page_tap_bar/home_page_tap_bar_import.dart';

class Gps extends StatelessWidget {
  const Gps({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ضع هنا الكود اللي عايز ينفذ عند الضغط
        print("تم الضغط على الـ Container");
        // مثال: الانتقال لشاشة جديدة
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
      },
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
