import 'package:flutter/material.dart';

class ViewWallet extends StatelessWidget {
  const ViewWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            "حجوزاتي",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        width: double.infinity, // عرض الشاشة بالكامل
        height: 100, // ارتفاع مناسب
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // مسافة خارجية
        decoration: BoxDecoration(
          color: Colors.black, // لون الخلفية
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // مسافة داخلية
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'رصيد محفظتك الحالي',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      SizedBox(width: 4),
                      Text(
                        "200 ﷼",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Group (4).png',
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
