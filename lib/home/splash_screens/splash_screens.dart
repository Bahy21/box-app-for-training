part of 'splash_screens_import.dart';
// import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  //didChangeDependencies
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(const Duration(milliseconds: 100));
    print("=================== after await ");
    showSheet(context);
  }

//showSheet

  void showSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context) {
        print("=================== inside build");
        return Container(
          height: 380,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, // كل العناصر على اليمين
            children: [
              // العنوان
              //language selection

              SplashScreensLanguageSelection(),
              const Spacer(),
              // button sheet
              SplashScreensButtonSheet(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFE9c2D),
      body: GestureDetector(
        onTap: () => showSheet(context),
        child: Center(
          child: Image.asset(
            "assets/images/loeg.png",
          ),
        ),
      ),
    );
  }
}
