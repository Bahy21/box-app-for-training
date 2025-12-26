import 'package:flutter/material.dart';
import 'app_theme_colors.dart';

/// Light Theme Colors
/// All color values for light mode based on Figma design
class LightThemeColors implements AppThemeColors {
  @override
  Color get scaffoldBackground => const Color(0xFFFFFFFF);

  @override
  Color get cardBackground => const Color(0xFFFFFFFF);

  @override
  Color get secondaryBackground => const Color(0xFFF9F9F9);

  @override
  Color get inputBackground => const Color(0xFFF9F9F9);

  @override
  Color get dialogBackground => const Color(0xFFFFFFFF);

  @override
  Color get bottomSheetBackground => const Color(0xFFFFFFFF);

  @override
  Color get appBarBackground => const Color(0xFFFFFFFF);

  @override
  Color get bottomNavBackground => const Color(0xFFFFFFFF);

  // ==================== TEXT COLORS ====================

  @override
  Color get textPrimary => const Color(0xFF000000);

  @override
  Color get textSecondary => const Color(0xFF666666);

  @override
  Color get textTertiary => const Color(0xFF707070);

  @override
  Color get textHint => const Color(0xFF9D9D9D);

  @override
  Color get textDisabled => const Color(0xFF9D9D9D);

  @override
  Color get textOnPrimary => const Color(0xFFFFFFFF);

  // ==================== BRAND COLORS ====================

  @override
  Color get primary => const Color(0xFFFE9C2D);

  @override
  Color get primaryLight => const Color(0xFFFFB85D);

  @override
  Color get primaryDark => const Color(0xFFEB652C);

  @override
  Color get success => const Color(0xFF1B9D00);

  @override
  Color get error => const Color(0xFFDB2524);

  @override
  Color get warning => const Color(0xFFFE9C2D);

  @override
  Color get info => const Color(0xFF2196F3);

  // ==================== BORDERS & DIVIDERS ====================

  @override
  Color get border => const Color(0xFFC9C9C9);

  @override
  Color get borderLight => const Color(0xFFE5E5E5);

  @override
  Color get borderFocused => const Color(0xFFFE9C2D);

  @override
  Color get borderError => const Color(0xFFDB2524);

  @override
  Color get divider => const Color(0xFFE5E5E5);

  // ==================== ICONS ====================

  @override
  Color get iconPrimary => const Color(0xFF000000);

  @override
  Color get iconSecondary => const Color(0xFF666666);

  @override
  Color get iconDisabled => const Color(0xFF9D9D9D);

  @override
  Color get iconOnPrimary => const Color(0xFFFFFFFF);

  // ==================== BUTTONS ====================

  @override
  Color get buttonPrimaryBackground => const Color(0xFFFE9C2D);

  @override
  Color get buttonPrimaryText => const Color(0xFFFFFFFF);

  @override
  Color get buttonSecondaryBackground => const Color(0xFFF9F9F9);

  @override
  Color get buttonSecondaryText => const Color(0xFF000000);

  @override
  Color get buttonDisabledBackground => const Color(0xFFE5E5E5);

  @override
  Color get buttonDisabledText => const Color(0xFF9D9D9D);

  // ==================== NAVIGATION ====================

  @override
  Color get bottomNavSelected => const Color(0xFFFE9C2D);

  @override
  Color get bottomNavUnselected => const Color(0xFF666666);

  // ==================== SHADOWS & OVERLAYS ====================

  @override
  Color get shadow => Colors.black.withValues(alpha: 0.1);

  @override
  Color get overlay => Colors.black.withValues(alpha: 0.5);

  @override
  Color get shimmerBase => const Color(0xFFE0E0E0);

  @override
  Color get shimmerHighlight => const Color(0xFFF5F5F5);

  // ==================== SPECIFIC APP COLORS ====================

  @override
  Color get green => const Color(0xFF1B9D00);

  @override
  Color get red => const Color(0xFFDB2524);

  @override
  Color get orange => const Color(0xFFFE9C2D);

  @override
  Color get nafathTeal => const Color(0xFF00897B);

  @override
  Color get cardGreen => const Color(0xFF259F00);

  @override
  Color get grayLight => const Color(0xFF707070);

  @override
  Color get grayMedium => const Color(0xFF666666);

  @override
  Color get grayDark => const Color(0xFF4A4A4A);

  @override
  Color get grayBold => const Color(0xFF525252);

  @override
  Color get grayHint => const Color(0xFF9D9D9D);

  @override
  Color get selectedBorder => const Color(0xFFEB652C);

  @override
  Color get unselected => const Color(0xFFC9C9C9);

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get otpCircleBackground => const Color(0xFFF2F2F2);

  @override
  Color get strokeColor => const Color(0xFFC9C9C9);

  @override
  Color get cardBodyColor => const Color(0xFFFAFAFA);

  @override
  Color get greyText => const Color(0xFF6D6D6D);

  @override
  Color get textColor => const Color(0xFF4E4E4E);

  @override
  Color get textColorSecondary => const Color(0xFFFFFFFF);
  @override
  Color get lightGrayBackground => const Color(0xFFF5F5F5);

  @override
  Color get cardBgColor => const Color(0xFFFBFBFB);

  @override
  Color get textSelectedColor => const Color(0xFF5A5A5A);

  @override
  Color get splashBackGroundColor => const Color(0xffFE9C2D);

  @override
  Color get borderColor => const Color(0xffC9C9C9);

  @override
  Color get iconsColor => Colors.white;

  @override
  Color get darkText => const Color(0xff6D6D6D);
  
  @override
  Color get textSecondaryDark => const Color(0xFF4E4E4E);

  @override
  Color get darkTextPrimary =>  Colors.white;
}
