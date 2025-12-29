part of 'submit_review_w_import.dart';

class SubmitReviewTextField extends StatefulWidget {
  const SubmitReviewTextField({super.key});

  @override
  State<SubmitReviewTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<SubmitReviewTextField> {
  final TextEditingController _controller = TextEditingController();
  bool isError = false;
  final int maxLength = 500;

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05), // مسافة عن حواف الشاشة
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            minLines: 4,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            textDirection: TextDirection.rtl,
            textAlignVertical: TextAlignVertical.top,
            maxLength: maxLength,
            buildCounter: (context,
                {required currentLength,
                  required isFocused,
                  maxLength}) =>
            null, // نلغي عداد Flutter الافتراضي
            decoration: InputDecoration(
              hintText: "شاركنا تجربتك وساعد الناس تختار الأفضل",
              hintStyle: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily:"DINNextLTArabic-Light.ttf" ,
                color: Colors.grey.shade500, // يمكن تغييره حسب التصميم
              ),

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

          SizedBox(height: h * 0.005),

          // عداد الحروف 0/500
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${_controller.text.length}/$maxLength",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
