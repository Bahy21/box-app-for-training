import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemMultiSelect extends StatelessWidget {
  final void Function() onItemSelect;
  final String name;
  final bool isSelected;
  const CustomItemMultiSelect({
    super.key,
    required this.onItemSelect,
    required this.name,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name, style: AppTextStyles.textStyle14(context))),
        widthSpace(10.w),
        Container(
          width: 18.w,
          height: 16.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.r)),
          child: Transform.scale(
            scale: 0.0022.sw,
            child: Checkbox(
              value: isSelected,
              onChanged: (val) {
                onItemSelect();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.r),
              ),
              activeColor: context.themeColors.primary,
            ),
          ),
        ),
      ],
    ).onTapShadow(borderRadius: BorderRadius.zero, function: onItemSelect);
  }
}
