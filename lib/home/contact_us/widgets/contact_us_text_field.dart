part of 'contact_us_w_import.dart';
class MessageTextField extends StatefulWidget {
  const MessageTextField({super.key});

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final TextEditingController _controller = TextEditingController();
  bool isError = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        isError = _controller.text.trim().isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          minLines: 4,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textDirection: TextDirection.rtl,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            hintText: "أكتب هنا.....",

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isError ? Colors.red : Colors.orange,
                width: 1.2,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isError ? Colors.red : Colors.orange,
                width: 1.5,
              ),
            ),

            contentPadding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
              vertical: h * 0.02,
            ),
          ),
        ),

        // رسالة الخطأ
        if (isError)
          Padding(
            padding: EdgeInsets.only(top: h * 0.008, right: w * 0.02),
            child: const Text(
              "يرجي ادخال نص الاقتراح / الشكوى ",
              style: TextStyle(
                color: Colors.red,
                fontSize: 13,
              ),
            ),
          ),
      ],
    );
  }
}
