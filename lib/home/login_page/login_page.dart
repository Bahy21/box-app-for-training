part of 'login_page_import.dart';

class ScreenName extends StatelessWidget {
  const ScreenName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: LoginPageAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان كبير

              LoginPageTextTitle(),
              const SizedBox(height: 30),
              //login page
              LoginPageScreen(),

              // تسمية الحقل
              //showModalBottomSheet
              LoginPageShowBottomsheet(),
            ],
          ),
        ),
      ),
    );
  }
}
