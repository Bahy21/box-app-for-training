import 'package:boxapp/wallet/wallet_two.dart';
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
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'رصيد محفظتك الحالي',
                              style:
                              TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const SizedBox(width: 4),
                                const Text(
                                  "200 ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset("assets/images/Vector (15).png"),
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
                ],
              )),
          Container(
            width: double.infinity,
            height: 70,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Image.asset("assets/images/Vector (16).png"),
                          const SizedBox(width: 6),
                          const Text(
                            "شحن المحفظة ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WalletTwo();
                        },
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "شحن",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 220),
            child: Text(
              "سجّل المعاملات",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  "assets/images/wallet (1).png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "شحن رصيد",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Stack(
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 4),
                            Text(
                              "23 أبريل 2025، 08:00ص",
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 15,
                          top: -8,
                          child: Row(
                            children: [
                              const Text(
                                "+ 500",
                                style:
                                TextStyle(fontSize: 22, color: Colors.black),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                "assets/images/رمز الريال السعودي بدقة عالية  svg – png 1.png",
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: 300,
            child: Divider(
              height: 30,
              thickness: 1,
              color: Colors.grey,
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  "assets/images/Vector (20).png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "دفع فاتورة #589654",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Stack(
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 4),
                            Text(
                              "23 أبريل 2025، 08:00ص",
                              style:
                              TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 15,
                          top: -8,
                          child: Row(
                            children: [
                              const Text(
                                "- 500",
                                style:
                                TextStyle(fontSize: 22, color: Colors.redAccent),
                              ),
                              const SizedBox(width: 4),
                              Image.asset(
                                "assets/images/رمز الريال السعودي بدقة عالية  svg – png 1.png",
                                width: 20,
                                color: Colors.redAccent,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
