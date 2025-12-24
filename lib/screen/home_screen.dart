import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/splash_screens/splash_screens_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffFE9c2D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                );
              },
              child: Image.asset(
                "assets/images/loeg.png",
                height: 120,
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}