import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? textAppBar;
  final dynamic textColor;
  final double? heightAppBar;
  final void Function()? onTap;
  final BuildContext context;
  final bool showBackButton;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.textAppBar,
    this.heightAppBar,
    this.onTap,
    this.textColor,
    required this.context,
    this.showBackButton = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: centerTitle,
        titleSpacing: showBackButton ? 0 : 24.w,
        leadingWidth: showBackButton ? 56.w : 0,
        leading:
            showBackButton
                ? IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back,
                    color: textColor ?? context.themeColors.textPrimary,
                  ),
                  onPressed: onTap ?? () => context.pop(),
                )
                : null,
        title:
            textAppBar != null
                ? Text(
                  textAppBar!,
                  style: AppTextStyles.textStyle16(context).copyWith(
                    color: textColor ?? context.themeColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                )
                : null,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, heightAppBar ?? 56.h);
}
