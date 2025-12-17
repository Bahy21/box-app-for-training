import 'package:flutter/material.dart';

import '../model_buttom.dart';

class WalletTwo extends StatefulWidget {
  const WalletTwo({super.key});

  @override
  State<WalletTwo> createState() => _WalletTwoState();
}

class _WalletTwoState extends State<WalletTwo> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "شحن الرصيد",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "قيمة الشحن",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: 'حدد قيمة الشحن',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.asset(
                    'assets/images/coin.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 270),
            child: Text(
              "طريقة الدفع",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              //  border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                // البطاقة الائتمانية
                Row(
                  children: [
                    Radio<String>(
                      value: "card",
                      groupValue: selectedPayment,
                      onChanged: (val) {
                        setState(() {
                          selectedPayment = val;
                        });
                      },
                    ),
                    const SizedBox(width: 8),

                    Text(
                      "البطاقة الائتمانية",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(
                      flex: 12,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Image.asset(
                        "assets/images/image 5.png",
                        height: 20,
                      ),
                    ),
                    // SizedBox(width: 2,)
                  ],
                ),
                const Divider(),
                // Apple Pay
                Row(
                  children: [
                    Radio<String>(
                      value: "wallet",
                      groupValue: selectedPayment,
                      onChanged: (val) {
                        setState(() {
                          selectedPayment = val;
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "Apple Pay",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Image.asset(
                      "assets/images/apple-pay 1 1 2.png",
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
SizedBox(height: 100,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10), // المسافة الداخلية رأسياً
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // التحكم في المسافة من الجوانب
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "شحن",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
