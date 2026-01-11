import 'package:box_app/core/widgets/custom_error.dart';
import 'package:box_app/core/widgets/custom_loading.dart';
import 'package:box_app/home/select_location/presentation/view/widgets/custom_current_location_widget.dart';
import 'package:box_app/home/select_location/presentation/view/widgets/custom_search_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../args/select_location_arg.dart';
import '../cubits/select_location_cubit/select_location_cubit.dart';

class SelectLocationView extends StatefulWidget {
  final SelectLocationArgument argument;

  const SelectLocationView({super.key, required this.argument});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  @override
  void initState() {
    final cubit = context.read<SelectLocationCubit>();
    cubit.checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SelectLocationCubit, SelectLocationState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<SelectLocationCubit>(context);
            return Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: cubit.onMapCreate,
                      initialCameraPosition: CameraPosition(
                        target: cubit.currentLocation!,
                        zoom: 15.0,
                      ),
                      onCameraMove: (cameraPos) {
                        cubit.onUpdateCamera(position: cameraPos);
                      },
                      onCameraIdle: () {
                        cubit.onCloseCamera();
                      },
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [CustomSearchLocationWidget(cubit: cubit)],
                      ),
                    ),
                    PositionedDirectional(
                      end: 24,
                      bottom: 322,
                      child: GestureDetector(
                        onTap: () {
                          cubit.checkPermissionAndUpdateCurrentLocation();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          child: SvgPicture.asset("assets/images/gps.svg"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: CustomCurrentLocationWidget(
                        cubit: cubit,
                        serviceId: widget.argument.serviceId,
                        state: state,
                      ),
                    ),
                  ],
                );
          },
        ),
      ),
    );
  }
}
