part of 'asked questions_setting_import.dart';

class AskedQuestions extends StatelessWidget {
  const AskedQuestions ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AskedQuestionSettingsAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            Row(
              children: [
                const Expanded(
                  //title
                  child: AskedQuestionSettingsTitle(),
                ),
                SizedBox(width: 20),
                Image.asset("assets/images/Vector (27).png"),
              ],
            ),
            const SizedBox(height: 20),
            // terms
            AskedQuestionSettingsTerms(),
            const SizedBox(height: 20),

            // Divider تحت كل المحتوى
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 30),
            // question
            AskedQuestionSettingsQuestion(),
          ],
        ),
      ),
    );
  }
}
