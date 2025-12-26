import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_loading.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  final double? height, width, strokeWidth;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;

  final EdgeInsets? padding;

  final String? text;
  final TextStyle? style;
  final bool? isLoading;

  const CustomButton({
    super.key,
    this.child,
    this.text,
    this.style,
    this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.isLoading = false,
    this.borderSide,
    this.borderRadius,
    this.padding,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = isLoading == true;
    return Center(
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? context.themeColors.primary,
          ),
          elevation: const WidgetStatePropertyAll(0),
          padding: WidgetStatePropertyAll(padding ?? EdgeInsets.zero),
          fixedSize: WidgetStatePropertyAll(
            Size(width ?? double.infinity, height ?? context.height * 0.065),
          ),
          minimumSize: WidgetStatePropertyAll(
            Size(width ?? double.infinity, height ?? context.height * 0.065),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(40.r),
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: WidgetStatePropertyAll(borderSide ?? BorderSide.none),
        ),
        child: Center(
          child: isLoading == true
              ? CupertinoActivityIndicator(
                  color: context.themeColors.textOnPrimary,
                  radius: 10.r,
                )
              : child ??
                  Text(
                    text!,
                    textAlign: TextAlign.center,
                    style:
                        style ??
                        AppTextStyles.textStyle16(context).copyWith(
                          fontWeight: FontWeight.w700,
                          color: context.themeColors.textOnPrimary,
                        ),
                  ),
        ),
      ),
    );
  }
}
