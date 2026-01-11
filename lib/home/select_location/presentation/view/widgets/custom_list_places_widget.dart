import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/search_places_cubit/search_places_bloc.dart';

class CustomListPlacesWidget extends StatelessWidget {
  final SearchPlacesBloc bloc;

  const CustomListPlacesWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: context.themeColors.cardBackground,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.r),
          topEnd: Radius.circular(10.r),
          bottomStart: Radius.circular(20.r),
          bottomEnd: Radius.circular(20.r),
        ),
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        itemCount: bloc.places.length,
        shrinkWrap: true,
        separatorBuilder: (context, index) => heightSpace(30.h),
        itemBuilder:
            (context, index) => Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 25.r,
                  color: context.themeColors.textPrimary,
                ),
                widthSpace(10.w),
                Expanded(
                  child: Text(
                    bloc.places[index].name,
                    style: AppTextStyles.textStyle16(context),
                  ),
                ),
              ],
            ).onTapShadow(
              function: () {
                bloc.add(GetPlaceCoordinates(placeId: bloc.places[index].id));
              },
              borderRadius: BorderRadius.zero,
            ),
      ),
    );
  }
}
