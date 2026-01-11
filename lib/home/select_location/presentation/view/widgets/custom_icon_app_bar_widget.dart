import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconAppBarWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final double? radius;

  const CustomIconAppBarWidget({
    super.key,
    required this.child,
    this.onTap,
    this.radius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: context.themeColors.cardBackground,
        shape: BoxShape.circle,
        border: Border.all(color: context.themeColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(child: child),
    ).onTapShadow(
      borderRadius: BorderRadius.circular(24.r),
      function:
          onTap ??
          () {
            context.pop();
          },
    );
  }
}
