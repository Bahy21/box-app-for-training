import 'package:box_app/core/constants/app_assets.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmptyData extends StatelessWidget {
  final String? image, text;

  const CustomEmptyData({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image ?? AppAssets.emptyData,
            height: context.height * 0.25,
          ),
          heightSpace(20.h),
          Text(
            text ?? LocaleKeys.emptyData.tr(),
            style: AppTextStyles.textStyle14(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
