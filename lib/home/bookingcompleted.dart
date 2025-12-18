import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'completed_booking_details/completed_booking_details_imports.dart';


class BookingCompleted extends StatelessWidget {
  const BookingCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 25),
        itemCount: 1,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const BookingCompletedResv(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.only(top:50,right: 10,left: 15,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/images/Rectangle.png",
                          width: 74,
                          height: 74,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),

                      // بيانات الوحدة
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(bottom:50),
                            child: Text(
                              "رقم الوحدة:",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(bottom:50),
                            child: Text(
                              "5697827",
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      // أيقونة التاريخ ورقم الحجز
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom:50),
                            child: SvgPicture.asset(
                              "assets/images/calender.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Padding(
                            padding: EdgeInsets.only(bottom:50),
                            child: Text(
                              "16 سبتمبر 2026",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(0, -28), // ← غير الرقم لحد ما يظبط معاك
                      child: const Padding(
                        padding: EdgeInsets.only(right: 90),
                        child: Text(
                          "200 ﷼",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
