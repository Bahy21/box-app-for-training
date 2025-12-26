import 'package:box_app/core/constants/app_assets.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/core/widgets/custom_button.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomError extends StatelessWidget {
  final String error;

  final void Function() retry;
  final bool? isLogo;

  const CustomError({
    super.key,
    required this.error,
    required this.retry,
    this.isLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return isLogo == true
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppAssets.logoSmall, height: 45.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    error == LocaleKeys.noInternetError.tr()
                        ? AppAssets.noInternet
                        : AppAssets.defaultError,
                    width:
                        error == LocaleKeys.noInternetError.tr()
                            ? context.width / 2.5
                            : context.width / 1.4,
                  ),
                  heightSpace(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      error,
                      style: AppTextStyles.textStyle14(
                        context,
                      ).copyWith(fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  heightSpace(20.h),
                  CustomButton(
                    onPressed: retry,
                    text: LocaleKeys.retry.tr(),
                    borderRadius: BorderRadius.circular(8.r),
                    height: context.height * 0.05,
                    width: context.width * 0.4,
                  ),
                ],
              ),
            ),
          ],
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              error == LocaleKeys.noInternetError.tr()
                  ? AppAssets.noInternet
                  : AppAssets.defaultError,
              width:
                  error == LocaleKeys.noInternetError.tr()
                      ? context.width / 2.5
                      : context.width / 1.4,
            ),
            heightSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                error,
                style: AppTextStyles.textStyle14(
                  context,
                ).copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            heightSpace(20.h),
            CustomButton(
              onPressed: retry,
              text: LocaleKeys.retry.tr(),
              borderRadius: BorderRadius.circular(8.r),
              height: context.height * 0.05,
              width: context.width * 0.4,
            ),
          ],
        );
  }
}
