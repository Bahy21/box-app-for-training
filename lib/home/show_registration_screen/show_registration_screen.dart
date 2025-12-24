part of 'show_registration_screen_import.dart';

class ShowModelScreen extends StatefulWidget {
  const ShowModelScreen({super.key});

  @override
  State<ShowModelScreen> createState() => _ShowModelScreenState();
}

class _ShowModelScreenState extends State<ShowModelScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView( // لو الصفحة أطول من الشاشة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60),

              // Row الصورة والنص على نفس السطر
              // continue
              ShowRegistrationScreenContinue(),
              SizedBox(height: 30),
              //text filed
              ShowRegistrationScreenTextFiled(hintText: '**********',),
              SizedBox(height: 150),
              // button
              ShowRegistrationScreenButton(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
