import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconPath,
    this.suffixIconPath,
    this.width,
    this.height,
    this.contentPadding,
  });

  final String? hintText;

  // الأيقونات
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final String? suffixIconPath;

  // التحكم في الحجم
  final double? width;
  final double? height;

  // التحكم في المسافات داخل التيكست فيلد
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,   // لو null هياخد العرض الطبيعي
      height: height, // لازم تضبط padding لو كبرته
      child: TextField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,

          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(vertical: 14, horizontal: 16),

          prefixIcon: prefixIcon ??
              (prefixIconPath != null
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(prefixIconPath!, width: 20, height: 20),
              )
                  : null),

          suffixIcon: suffixIcon ??
              (suffixIconPath != null
                  ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(suffixIconPath!, width: 20, height: 20),
              )
                  : null),

          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
      ),
    );
  }
}
