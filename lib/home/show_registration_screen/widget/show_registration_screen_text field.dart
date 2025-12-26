part of 'show_registration_screen_w_import.dart';

class ShowRegistrationScreenTextFiled extends StatelessWidget {
  const ShowRegistrationScreenTextFiled({
    super.key,
    required this.hintText,
    this.controller,
  });

  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade50,
          ),
        ),
        suffixIcon: SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 1,
                  height: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                // الصورة
                const Text(
                  "+966",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                SvgPicture.asset(
                  "assets/images/Clip path group.svg",
                  height: 25,
                ),
                const SizedBox(width: 8),

                // النص

                const SizedBox(width: 8),

                // Divider بعد النص
              ],
            ),
          ),
        ),
      ),
    );
  }
}
