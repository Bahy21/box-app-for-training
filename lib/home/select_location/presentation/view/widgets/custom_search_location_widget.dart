import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubits/search_places_cubit/search_places_bloc.dart';
import '../../cubits/select_location_cubit/select_location_cubit.dart';
import 'custom_icon_app_bar_widget.dart';
import 'custom_list_places_widget.dart';
import 'custom_search_location_text_field_widget.dart';

class CustomSearchLocationWidget extends StatelessWidget {
  final SelectLocationCubit cubit;

  const CustomSearchLocationWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: BlocConsumer<SearchPlacesBloc, SearchPlacesState>(
        listener: (context, state) {
          if (state is GetCoordinatesSuccessState) {
            BlocProvider.of<SelectLocationCubit>(context).updateCameraPos(
              pos: context.read<SearchPlacesBloc>().searchedPosition!,
            );
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<SearchPlacesBloc>(context);
          return Column(
            children: [
              Row(
                children: [
                  CustomIconAppBarWidget(
                    child: const Icon(Icons.close),
                    onTap: () {
                      cubit.skipLocationSelection(context: context);
                    },
                  ),
                  widthSpace(8),
                  Expanded(
                    child: CustomSearchLocationTextFieldWidget(bloc: bloc),
                  ),
                ],
              ),
              state is SearchPlacesFailureState
                  ? Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsetsDirectional.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      color: context.themeColors.cardBackground,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(10.r),
                        topEnd: Radius.circular(10.r),
                        bottomStart: Radius.circular(20.r),
                        bottomEnd: Radius.circular(20.r),
                      ),
                    ),
                    child: CustomError(
                      error: state.error,
                      isLogo: false,
                      retry: () {
                        bloc.add(
                          GetPlacesSuggestionsEvent(
                            searchQuery: bloc.searchCtrl.text,
                          ),
                        );
                      },
                    ),
                  )
                  : bloc.places.isEmpty
                  ? const SizedBox.shrink()
                  : CustomListPlacesWidget(bloc: bloc),
            ],
          );
        },
      ),
    );
  }
}
