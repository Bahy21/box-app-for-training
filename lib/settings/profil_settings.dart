import 'package:boxapp/settings/point_settings.dart';
import 'package:flutter/material.dart';
import '../custem_text_filed.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/right-arrow.png",
                width: 30, // حجم مناسب
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "ملفي الشخصي",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    // backgroundImage: AssetImage('assets/images/wallet.svg'), // أو NetworkImage
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "الأسم كامل",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(hintText: "Abdallrhman Fathy"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "الايميل",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(hintText: "abdallrhman@gmail.com"),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "رقم الجوال",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(
              suffixIcon: Icon(
                Icons.lock,
                size: 20,
                color: Colors.black,
              ),
              hintText: "01002412682",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "المدينة",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PointSettings(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: [
                      Text(
                        "الرياض",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      const Spacer(),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/Vector (26).png',
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 120),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "حفظ التغييرات",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
