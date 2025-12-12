import 'package:flutter/material.dart';

class CustomTextFieldImage extends StatelessWidget {
  const CustomTextFieldImage({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconPath,
    this.suffixIconPath,
    this.width,
    this.height,
    this.contentPadding,

    // prefix control
    this.prefixWidth,
    this.prefixHeight,
    this.prefixPadding,

    // suffix control
    this.suffixWidth,
    this.suffixHeight,
    this.suffixPadding,
  });

  final String? hintText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixIconPath;
  final String? suffixIconPath;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;

  final double? prefixWidth;
  final double? prefixHeight;
  final EdgeInsetsGeometry? prefixPadding;

  final double? suffixWidth;
  final double? suffixHeight;
  final EdgeInsetsGeometry? suffixPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 60,
      child: TextField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,

          // IMPORTANT: لو فيه صورة كبيرة — خلي padding صفر
          contentPadding: contentPadding ?? EdgeInsets.zero,

          // prefix image
          prefixIcon: prefixIcon ??
              (prefixIconPath != null
                  ? Padding(
                padding: prefixPadding ?? EdgeInsets.zero,
                child: Image.asset(
                  prefixIconPath!,
                  width: prefixWidth ?? 25,
                  height: prefixHeight ?? 25,
                  fit: BoxFit.contain,
                ),
              )
                  : null),

          // suffix image
          suffixIcon: suffixIcon ??
              (suffixIconPath != null
                  ? Padding(
                padding: suffixPadding ?? EdgeInsets.zero,
                child: Image.asset(
                  suffixIconPath!,
                  width: suffixWidth ?? 25,
                  height: suffixHeight ?? 25,
                  fit: BoxFit.contain,
                ),
              )
                  : null),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.orange),

          ),
        ),
      ),
    );
  }
}
