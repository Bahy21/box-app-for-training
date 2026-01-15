import 'package:box_app/home/select_location/presentation/view/widgets/custom_current_location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool _isInitialized = false;

  void _initializeCubit(SelectLocationCubit cubit) {
    if (_isInitialized) return;
    _isInitialized = true;
    
    final isFromRegistration = widget.argument.navigateToHome &&
        (widget.argument.serviceId.isEmpty ||
            widget.argument.serviceId == '');
    cubit.setSearchParams(
      method: widget.argument.method,
      perPage: widget.argument.perPage,
      navigateToHome: widget.argument.navigateToHome,
      isFromRegistration: isFromRegistration,
    );

    cubit.checkPermission();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      // Use addPostFrameCallback to ensure the widget is fully built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _isInitialized) return;
        try {
          final cubit = BlocProvider.of<SelectLocationCubit>(context);
          _initializeCubit(cubit);
        } catch (e) {
          // Handle error if cubit is not available
          debugPrint('Error initializing SelectLocationCubit: $e');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SelectLocationCubit, SelectLocationState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<SelectLocationCubit>(context);
            return
              Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: cubit.onMapCreate,
                      initialCameraPosition: CameraPosition(
                        target: cubit.currentLocation ?? LatLng(0, 0),
                        zoom: 15.0,
                      ),
                      onCameraMove: (cameraPos) {
                        cubit.onUpdateCamera(position: cameraPos);
                      },
                      onCameraIdle: () {
                        cubit.onCloseCamera();
                      },
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
