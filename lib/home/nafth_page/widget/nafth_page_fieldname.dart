part of 'nafth_page_w_import.dart';

class NafthPageFieldName extends StatelessWidget {
  const NafthPageFieldName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "رقم الهوية",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 10),
        //add number
        CustomTextField(
          hintText: "أدخل رقم الهوية",
          suffixIconPath: "assets/images/shield.png",
        ),
      ],
    );
  }
}
