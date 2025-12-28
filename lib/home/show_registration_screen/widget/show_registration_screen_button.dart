part of 'show_registration_screen_w_import.dart';

class ShowRegistrationScreenButton extends StatelessWidget {
   ShowRegistrationScreenButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NextPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          width: width,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تسجيل الدخول",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
