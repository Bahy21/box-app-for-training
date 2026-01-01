part of 'show_registration_screen_w_import.dart';

class ShowRegistrationScreenTextFiled extends StatefulWidget {
  const ShowRegistrationScreenTextFiled({
    super.key,
    required this.hintText,
    this.controller,
  });

  final String hintText;
  final TextEditingController? controller;

  @override
  State<ShowRegistrationScreenTextFiled> createState() =>
      _ShowRegistrationScreenTextFiledState();
}

class _ShowRegistrationScreenTextFiledState
    extends State<ShowRegistrationScreenTextFiled> {
  late TextEditingController controller;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller!;
    controller.addListener(() {
      setState(() {
        isError = controller.text.length > 11;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          style: TextStyle(fontSize: 16.sp),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.right,

          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: widget.hintText,
            counterText: "",
            contentPadding: EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 14.w,
            ),
            hintStyle: TextStyle(fontSize: 14.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: isError ? Colors.red : Colors.grey,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: isError ? Colors.red : Colors.grey,
                width: 1.w,
              ),
            ),
            suffixIcon: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1.w,
                      height: 26.h,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      "+966",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    SvgPicture.asset(
                      "assets/images/Clip path group.svg",
                      height: 20.h,
                    ),
                    SizedBox(width: 6.w),
                  ],
                ),
              ),
            ),
          ),
        ),
        // رسالة الخطأ
        if (isError)
          Padding(
            padding: EdgeInsets.only(top: 5.h, right: 5.w),
            child: Text(
              "رقم الجوال غير صالح",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }
}
