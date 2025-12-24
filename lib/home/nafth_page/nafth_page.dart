part of 'nafth_page_import.dart';

class NafathPage extends StatelessWidget {
  const NafathPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                //loge and text
                // صورة في المنتصف
                NafthPageLogeAndText(),
                // تسمية حقل الهوية
                //field name
                NafthPageFieldName(),
                SizedBox(height: 130),
                // verify
                NafthPageVerify(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
