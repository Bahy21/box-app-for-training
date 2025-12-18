part of 'booking_information_w_import.dart';
class BookingInformationDetails extends StatelessWidget {
  const BookingInformationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
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
        const Row(
          children: [
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
        const Row(
          children: [
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
    );
  }
}
