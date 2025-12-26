import 'package:box_app/core/constants/app_constants.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_fonts.dart';

/// Theme-aware text styles
/// Now automatically uses correct colors for light/dark mode
///
/// Usage: AppTextStyles.textStyle16(context)
abstract class AppTextStyles {
  // ==================== BASE TEXT STYLES ====================

  static TextStyle textStyle24(BuildContext context) => TextStyle(
    fontSize: AppFonts.t24,
    fontWeight: FontWeight.w500,
    color: context.themeColors.primary,
  );

  static TextStyle textStyle28(BuildContext context) => TextStyle(
    fontSize: AppFonts.t28,
    fontWeight: FontWeight.w500,
    color: context.themeColors.primary,
  );

  static TextStyle textStyle20(BuildContext context) => TextStyle(
    fontSize: AppFonts.t20,
    fontWeight: FontWeight.w400,
    color: context.themeColors.textPrimary,
  );

  static TextStyle textStyle18(BuildContext context) => TextStyle(
    fontSize: AppFonts.t18,
    fontWeight: FontWeight.w400,
    color: context.themeColors.textPrimary,
  );

  static TextStyle textStyle16(BuildContext context) => TextStyle(
    fontSize: AppFonts.t16,
    fontWeight: FontWeight.w400,
    color: context.themeColors.textPrimary,
    fontFamily: AppConstants.fontFamily,
  );

  static TextStyle textStyle14(BuildContext context) => TextStyle(
    fontSize: AppFonts.t14,
    fontWeight: FontWeight.w400,
    color: context.themeColors.textPrimary,
  );

  static TextStyle textStyle12(BuildContext context) => TextStyle(
    fontSize: AppFonts.t12,
    fontWeight: FontWeight.w400,
    color: context.themeColors.textPrimary,
  );

  static TextStyle textStyle10(BuildContext context) => TextStyle(
    fontSize: AppFonts.t10,
    fontWeight: FontWeight.w400,
    color: context.themeColors.textSelectedColor,
  );

  // ==================== SEMANTIC TEXT STYLES ====================

  static TextStyle pageTitle(BuildContext context) => textStyle24(context);
  static TextStyle sectionTitle(BuildContext context) => textStyle20(context);
  static TextStyle subtitle(BuildContext context) => textStyle16(context);
  static TextStyle subtitleSmall(BuildContext context) => textStyle14(context);
  static TextStyle bodyLarge(BuildContext context) => textStyle16(context);
  static TextStyle bodyMedium(BuildContext context) => textStyle14(context);
  static TextStyle bodySmall(BuildContext context) => textStyle12(context);
  static TextStyle caption(BuildContext context) => textStyle12(context);
  static TextStyle captionSmall(BuildContext context) => textStyle10(context);

  // ==================== BUTTON TEXT STYLES ====================

  static TextStyle buttonText(BuildContext context) => TextStyle(
    fontSize: AppFonts.t16,
    fontWeight: FontWeight.w500,
    color: context.themeColors.white,
  );

  static TextStyle buttonTextLarge(BuildContext context) => TextStyle(
    fontSize: AppFonts.t18,
    fontWeight: FontWeight.w400,
    color: context.themeColors.white,
  );

  // ==================== HEADING TEXT STYLES ====================

  static TextStyle heading24Medium(BuildContext context) => TextStyle(
    fontSize: AppFonts.t24,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
    height: 1.6,
  );

  static TextStyle heading22Medium(BuildContext context) => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
  );

  static TextStyle heading22Bold(BuildContext context) => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
  );

  static TextStyle heading18Bold(BuildContext context) => TextStyle(
    fontSize: AppFonts.t18,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
  );

  // ==================== SPECIALIZED TEXT STYLES ====================

  static TextStyle text16Medium(BuildContext context) => TextStyle(
    fontSize: AppFonts.t16,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
  );

  static TextStyle text16MediumGray(BuildContext context) => TextStyle(
    fontSize: AppFonts.t16,
    fontWeight: FontWeight.w500,
    color: context.themeColors.grayMedium,
  );

  static TextStyle text16MediumOrange(BuildContext context) => TextStyle(
    fontSize: AppFonts.t16,
    fontWeight: FontWeight.w500,
    color: context.themeColors.orange,
  );

  static TextStyle text16RegularGray(BuildContext context) => TextStyle(
    fontSize: AppFonts.t16,
    fontWeight: FontWeight.w400,
    color: context.themeColors.grayMedium,
  );

  static TextStyle text14Medium(BuildContext context) => TextStyle(
    fontSize: AppFonts.t14,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
  );

  static TextStyle text14MediumWithHeight(BuildContext context) => TextStyle(
    fontSize: AppFonts.t14,
    fontWeight: FontWeight.w500,
    color: context.themeColors.textPrimary,
    height: 1.71,
  );

  static TextStyle text14RegularGray(BuildContext context) => TextStyle(
    fontSize: AppFonts.t14,
    fontWeight: FontWeight.w400,
    color: context.themeColors.grayLight,
  );

  static TextStyle text14RegularGrayWithHeight(BuildContext context) =>
      TextStyle(
        fontSize: AppFonts.t14,
        fontWeight: FontWeight.w400,
        color: context.themeColors.grayLight,
        height: 1.5,
      );

  static TextStyle text14RegularOrangeUnderline(BuildContext context) =>
      TextStyle(
        fontSize: AppFonts.t14,
        fontWeight: FontWeight.w400,
        color: context.themeColors.orange,
        decoration: TextDecoration.underline,
      );

  // ==================== LABEL TEXT STYLES ====================

  static TextStyle label(BuildContext context) => text14Medium(context);
  static TextStyle labelGray(BuildContext context) =>
      text14RegularGray(context);
}
