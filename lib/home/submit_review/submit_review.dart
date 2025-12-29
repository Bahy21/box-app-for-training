part of 'submit_review_import.dart';

class SubmitReview extends StatelessWidget {
  const SubmitReview({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.85),
            child: Container(
              width: screenWidth * 0.1, // 10% من عرض الشاشة
              height: screenWidth * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05), // 5% من ارتفاع الشاشة
            Center(
              child: Image.asset(
                "assets/images/Rectangle 4.png",
                width: screenWidth * 0.5, // 50% من عرض الشاشة
              ),
            ),
            SizedBox(height: screenHeight * 0.04), // 4% من ارتفاع الشاشة
            Center(
              child: Text(
                "كيف كانت تجربتك مع الوحدة رقم",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05, // حجم خط ديناميكي
                ),
              ),
            ),
            Center(
              child: Text(
                " 589687؟",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 5; i++) ...[
                  Image.asset(
                    "assets/images/star.png",
                    width: screenWidth * 0.08, // نجمة بحجم ديناميكي
                  ),
                  if (i < 4) SizedBox(width: screenWidth * 0.02),
                ]
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            Center(
              child: Text(
                "راضي جداً",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,

                  fontFamily: "DINNextLTArabic-Bold.ttf",
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
           Padding(
             padding: const EdgeInsets.only(right: 20),
             child: Text(
                  "تعليقك (اختياري)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
           ),

            SizedBox(height: screenHeight * 0.015),


            SubmitReviewTextField(),
            SizedBox(height: screenHeight * 0.060),

            SubmitReviewContainer(),

          ],
        ),
      ),
    );
  }
}
