import 'package:box_app/core/constants/app_assets.dart';
import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/theme_cubit.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubits/select_location_cubit/select_location_cubit.dart';

class CustomCurrentLocationWidget extends StatelessWidget {
  final SelectLocationCubit cubit;
  final SelectLocationState state;

  final String serviceId;

  const CustomCurrentLocationWidget({
    super.key,
    required this.cubit,
    required this.serviceId,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: context.themeColors.cardBackground,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(24.r),
          topStart: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/loction (10).svg",
                height: 40.h,
              ),
              widthSpace(15.w),
            ],
          ),
          heightSpace(32.h),
          CustomButton(
            onPressed: () {
              if (cubit.currentLocation != null) {
                cubit.updateLocation(
                  context: context,
                  address: cubit.currentLocationName,
                  method: cubit.method,
                  perPage: cubit.perPage,
                  navigateToHome: cubit.navigateToHome,
                );
              }
            },
            isLoading: state is UpdateLocationLoading,
          )        ],
      ),
    );
  }
}
