import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextStyle? style ;
  final TextStyle? hintStyle ;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final int? maxLines;
  final double? borderRadiusValue;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor;
  final Color? enabledColor;

  const CustomTextFormField({
    super.key,
    this.ctrl,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.style,
    this.readOnly = false,
    this.maxLines = 1,
    this.autoValidateMode,
    this.onChanged,
    this.onTap,
    this.borderRadiusValue,
    this.contentPadding,
    this.prefixIcon,
    this.fillColor,
    this.enabledColor,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: ctrl,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: onTap,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      style: style?? AppTextStyles.textStyle14(
        context,
      ).copyWith(color: context.themeColors.textPrimary),
      inputFormatters: inputFormatters,
      readOnly: readOnly!,
      validator: validator,
      maxLines: maxLines,
      autovalidateMode: autoValidateMode,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? context.themeColors.inputBackground,
        border: buildOutlineInputBorder(context, enabledColor),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle:hintStyle ?? AppTextStyles.textStyle14(
          context,
        ).copyWith(color: context.themeColors.textSecondary),
        focusedBorder: buildOutlineInputBorder(
          context,
          enabledColor ?? context.themeColors.selectedBorder,
        ),
        enabledBorder: buildOutlineInputBorder(context, enabledColor),
        errorBorder: buildOutlineInputBorder(
          context,
          enabledColor ?? context.themeColors.red,
        ),
        focusedErrorBorder: buildOutlineInputBorder(
          context,
          enabledColor ?? context.themeColors.red,
        ),
        errorStyle: AppTextStyles.textStyle12(
          context,
        ).copyWith(color: context.themeColors.red),
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
        isDense: true,
      ),
      onChanged: onChanged,
    );
  }

  OutlineInputBorder buildOutlineInputBorder(
    BuildContext context, [
    Color? color,
  ]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 16),
      borderSide: BorderSide(color: color ?? context.themeColors.border),
    );
  }
}
