import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/constants/app_assets.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_button.dart';

class CustomLoginExpiredDialog extends StatelessWidget {
  const CustomLoginExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.unAuthenticated,
                  height: context.height * 0.08,
                ),
                heightSpace(20.h),
                Text(
                  LocaleKeys.unAuthenticated.tr(),
                  style: AppTextStyles.textStyle14(context),
                  textAlign: TextAlign.center,
                ),
                heightSpace(25.h),
                CustomButton(
                  onPressed: () {
                    context.pushAndRemoveUntilWithNamed(Routes.loginView);
                  },
                  height: context.height * 0.055,
                  borderRadius: BorderRadius.circular(10.r),

                  text: LocaleKeys.signIn.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
