import 'package:box_app/core/constants/app_assets.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/theme_cubit.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubits/search_places_cubit/search_places_bloc.dart';

class CustomSearchLocationTextFieldWidget extends StatefulWidget {
  final SearchPlacesBloc bloc;

  const CustomSearchLocationTextFieldWidget({super.key, required this.bloc});

  @override
  State<CustomSearchLocationTextFieldWidget> createState() =>
      _CustomSearchLocationTextFieldWidgetState();
}

class _CustomSearchLocationTextFieldWidgetState
    extends State<CustomSearchLocationTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: context.themeColors.cardBackground,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: context.themeColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: widget.bloc.searchCtrl,
        style: AppTextStyles.textStyle14(
          context,
        ).copyWith(color: context.themeColors.textPrimary),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          widget.bloc.add(GetPlacesSuggestionsEvent(searchQuery: value));
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          fillColor: Colors.transparent,
          border: InputBorder.none,
          prefixIcon: Transform.scale(
            scale: .5,
            child: SvgPicture.asset("assets/images/search.svg"),
          ),
          hintText: 'searchYourLocation'.tr(),
          hintStyle: AppTextStyles.textStyle14(
            context,
          ).copyWith(color: context.themeColors.textSecondary),
          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
          isDense: true,
        ),
      ),
    );
  }
}
