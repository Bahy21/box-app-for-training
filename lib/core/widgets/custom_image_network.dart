import 'package:box_app/core/constants/app_assets.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageNetwork extends StatelessWidget {
  final double? heightImage,
      widthImage,
      heightLoading,
      widthLoading,
      heightImageError,
      widthImageError,
      strokeWidth,
      widthBigImageLoading;

  final BoxFit? fit;
  final String image;
  final TextStyle? textStyleProblemImage, textStyleLoading;
  final bool? isShowText, isBigLoading;

  const CustomImageNetwork({
    super.key,
    this.heightImage,
    this.widthImage,
    this.fit,
    required this.image,
    this.textStyleProblemImage,
    this.heightImageError,
    this.widthImageError,
    this.isShowText = false,
    this.isBigLoading = false,
    this.heightLoading,
    this.widthLoading,
    this.strokeWidth,
    this.textStyleLoading,
    this.widthBigImageLoading,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit,
      height: heightImage,
      width: widthImage,
      placeholder:
          (context, url) =>
              isBigLoading == false
                  ? Center(
                    child: SizedBox(
                      height: heightLoading ?? 20.h,
                      width: widthLoading ?? 20.w,
                      child: CircularProgressIndicator(
                        color: context.themeColors.border,
                        strokeWidth: strokeWidth ?? 4.w,
                      ),
                    ),
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.fanniLoading,
                        width: widthBigImageLoading ?? context.width / 2.5,
                      ),
                      heightSpace(10.h),
                      Text(
                        LocaleKeys.loading.tr(),
                        style:
                            textStyleLoading ??
                            AppTextStyles.textStyle16(
                              context,
                            ).copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
      errorWidget:
          (context, url, error) =>
              isShowText == false
                  ? Center(
                    child: SvgPicture.asset(
                      AppAssets.noImage,
                      height: heightImageError,
                      width: widthImageError,
                    ),
                  )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppAssets.noImage,
                        height: heightImageError,
                        width: widthImageError,
                      ),
                      heightSpace(10.h),
                      Text(
                        LocaleKeys.problemImage.tr(),
                        style:
                            textStyleProblemImage ??
                            AppTextStyles.textStyle10(
                              context,
                            ).copyWith(color: context.themeColors.textPrimary),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
    );
  }
}
