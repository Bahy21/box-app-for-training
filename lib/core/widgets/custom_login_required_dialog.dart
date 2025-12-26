import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_button.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginRequiredDialog extends StatelessWidget {
  const CustomLoginRequiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      backgroundColor: context.themeColors.dialogBackground,
      content: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                LocaleKeys.loginRequired.tr(),
                style: AppTextStyles.textStyle18(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.themeColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(16.h),
              // Description
              Text(
                LocaleKeys.pleaseLoginToCompleteAction.tr(),
                style: AppTextStyles.textStyle14(context).copyWith(
                  color: context.themeColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(32.h),
              // Buttons Row
              Row(
                children: [
                  // Login Button (Right)
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.pushWithNamed(Routes.loginView);
                      },
                      text: LocaleKeys.login.tr(),
                      backgroundColor: context.themeColors.primary,
                      style: AppTextStyles.textStyle14(context).copyWith(
                        color: context.themeColors.textOnPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  widthSpace(12.w),
                  // Cancel Button (Left)
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: LocaleKeys.cancel.tr(),
                      backgroundColor: context.themeColors.cardBackground,
                      borderSide: BorderSide(
                        color: context.themeColors.border,
                        width: 1.5,
                      ),
                      style: AppTextStyles.textStyle14(context).copyWith(
                        color: context.themeColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper function to show login required dialog and navigate to login if confirmed
Future<void> showLoginRequiredDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const CustomLoginRequiredDialog(),
  );
}
