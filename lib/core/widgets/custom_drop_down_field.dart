import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDownField extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String hintText;

  final void Function(String?) onChanged;
  final String? Function(String? value)? validator;
  final String? value;
  final AutovalidateMode? autoValidateMode;
  final Color? borderColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;

  const CustomDropDownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.hintText,
    this.validator,
    this.autoValidateMode,
    this.borderColor,
    this.contentPadding,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items,
      hint: Text(
        hintText,
        style:hintStyle ?? AppTextStyles.textStyle14(
          context,
        ).copyWith(color: context.themeColors.textSecondary),
      ),
      validator: validator,
      isDense: true,
      iconSize: 26.r,
      autovalidateMode: autoValidateMode,
      iconEnabledColor: context.themeColors.grayMedium,
      borderRadius: BorderRadius.circular(16),
      padding: EdgeInsets.zero,
      decoration: InputDecoration(
        isDense: true,
        border: buildOutlineInputBorder(context),
        enabledBorder: buildOutlineInputBorder(context, borderColor),
        errorBorder: buildOutlineInputBorder(context, context.themeColors.red),
        focusedErrorBorder: buildOutlineInputBorder(
          context,
          context.themeColors.red,
        ),
        errorStyle: AppTextStyles.textStyle12(
          context,
        ).copyWith(color: context.themeColors.red),
        hintStyle: AppTextStyles.textStyle14(
          context,
        ).copyWith(color: context.themeColors.textSecondary),
        contentPadding:
            contentPadding ??
            EdgeInsetsDirectional.only(
              top: 11.h,
              bottom: 11.h,
              end: 10.w,
              start: 15.w,
            ),
        focusedBorder: buildOutlineInputBorder(
          context,
          context.themeColors.selectedBorder,
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
      onChanged: onChanged,
    );
  }

  OutlineInputBorder buildOutlineInputBorder(
    BuildContext context, [
    Color? color,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: color ?? context.themeColors.border),
    );
  }
}
