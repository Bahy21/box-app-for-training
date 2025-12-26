import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/helpers/custom_location_helper.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class CustomLocationPermissionDialog extends StatelessWidget {
  final Function() onFinish;

  const CustomLocationPermissionDialog({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        onFinish();
      },
      child: AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: context.themeColors.dialogBackground,
        content: SizedBox(
          width: context.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.allowLocationDetection.tr(),
                  style: AppTextStyles.textStyle18(
                    context,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                heightSpace(18.h),
                Text(
                  LocaleKeys.allowLocationDescription.tr(),
                  style: AppTextStyles.textStyle16(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
                heightSpace(22.h),
                Text(
                  LocaleKeys.step1.tr(),
                  style: AppTextStyles.textStyle14(context),
                ),
                heightSpace(16.h),
                Text(
                  LocaleKeys.step2.tr(),
                  style: AppTextStyles.textStyle14(context),
                ),
                heightSpace(16.h),
                Text(
                  LocaleKeys.step3.tr(),
                  style: AppTextStyles.textStyle14(context),
                ),
                heightSpace(25.h),
                CustomButton(
                  onPressed: () {
                    LocationHelper.openAppIfPermissionDenied(
                      onFinish: onFinish,
                    );
                  },
                  text: LocaleKeys.goToSettings.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
