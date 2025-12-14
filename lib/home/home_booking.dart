import 'package:boxapp/home/home_reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBooking extends StatelessWidget {
  const HomeBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset("assets/images/Vector.svg"),
            ),
            const SizedBox(width: 15),
            const Text(
              "تفاصيل الحجز",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 75),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "حجز نشط",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Image.asset(
                          "assets/images/Rectangle 4.png",
                          height: 122,
                          width: 99,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "رقم الوحدة: ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "5697827",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Text(
                                  "كود فتح الباب",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "589678",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "تاريخ ووقت الحجز",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/calender.svg",
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "16 سبتمبر 2026",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 40),
                        SvgPicture.asset(
                          "assets/images/time.svg",
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "02:00م - 04:00م",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    const Divider(height: 25, color: Colors.grey),

                    const Text(
                      "الموقع",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/Rectangle 4264.png",
                          height: 122,
                          width: 99,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "الرياض، الرياض، قرطبة",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "فتح الخريطة",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 8),
                                  Image.asset("assets/images/Vector (12).png"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(height: 25, color: Colors.grey),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Text(
                          "طريقة الدفع",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 75),
                        SvgPicture.asset(
                          "assets/images/wallet.svg",
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "محفظة كمفورت بوكس",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const Divider(height: 25, color: Colors.grey),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ملخّص الحجز",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Text(
                              "مبلغ الحجز",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "300 ﷼",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Text(
                              "الخصم",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(flex: 1),
                            Text(
                              "50 ﷼",
                              style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Text(
                              "المبلغ الإجمالي",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "250 ﷼",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Image.asset("assets/images/Vector (13).png"),
                            const SizedBox(width: 10),
                            const Text(
                              "إبلاغ عن مشكلة",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 400,
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 30),
                                          const Text(
                                            "الإبلاغ عن وجود مشكلة",
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "وصف المشكلة",
                                            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.right,
                                          ),
                                          const SizedBox(height: 10),
                                          const TextField(
                                            maxLines: 5,

                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: " صف هنا ما المشكلة التي تواجهك",
                                            ),
                                          ),
                                          SizedBox(height:20),
                                          Container(
                                            height: 50,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "إرسال",
                                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                            ),
                                          ),

                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Image.asset("assets/images/arrow.png"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 350,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "مغادرة الوحدة",
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
