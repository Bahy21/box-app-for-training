import 'dart:async';
import 'dart:io';

import 'package:box_app/core/helpers/custom_location_helper.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/widgets/custom_toast.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api_constants/auth_repository/auth_repository.dart';
import '../../../../../api_verify_code/pin_code_cubit/user_cubit.dart';
import '../../../data/arguments/service_details_argument.dart';
import '../../../data/params/select_location_param.dart';
import '../../../data/params/update_location_param.dart';
import '../../../data/repository/select_location_repository.dart';

part 'select_location_state.dart';

@injectable
class SelectLocationCubit extends Cubit<SelectLocationState> {
  final SelectLocationRepository repository;
  final UserCubit userCubit;
  final AuthRepository authRepository;

  SelectLocationCubit(this.repository, this.userCubit, this.authRepository)
    : super(SelectLocationInitial());
  int? method;
  int? perPage;
  bool navigateToHome = false;
  bool isFromRegistration = false;

  void setSearchParams({
    int? method,
    int? perPage,
    bool navigateToHome = false,
    bool isFromRegistration = false,
  }) {
    this.method = method;
    this.perPage = perPage;
    this.navigateToHome = navigateToHome;
    this.isFromRegistration = isFromRegistration;
  }

  final searchLocationCtrl = TextEditingController();

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  GoogleMapController? googleMapController;

  LatLng? currentLocation;

  String? currentLocationName;

  void onMapCreate(GoogleMapController controller) async {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
      googleMapController = await mapController.future;
      emit(OnMapCreateSuccess());
    }
  }

  void checkPermission() async {
    emit(GetCurrentLoading());
    await Geolocator.requestPermission();
    bool serviceEnabled = await LocationHelper.isServiceEnabled();
    bool serviceHavePermission = await LocationHelper.isServiceHavePermission();
    if (serviceEnabled && serviceHavePermission) {
      return getCurrentLocation(isApple: false);
    } else if (!serviceEnabled && serviceHavePermission) {
      return getCurrentLocation(isApple: false);
    } else if (serviceEnabled && !serviceHavePermission) {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return getCurrentLocation(isApple: false);
          } else {
            return getCurrentLocation(isApple: true);
          }
        },
      );
    } else {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return getCurrentLocation(isApple: false);
          } else {
            /// lat 21.437273, long 40.512714
            return getCurrentLocation(isApple: true);
          }
        },
      );
    }
  }

  void getCurrentLocation({required bool isApple}) async {
    try {
      if (isApple == true) {
        currentLocation = const LatLng(21.437273, 40.512714);
      } else {
        Position position = await LocationHelper.getCurrentPosition();
        currentLocation = LatLng(position.latitude, position.longitude);
      }
      Placemark placeMark = await LocationHelper.getLocationInfo(
        currentLocation!,
      );
      currentLocationName =
          "${placeMark.name}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}";
      emit(GetCurrentSuccess());
    } catch (error) {
      emit(GetCurrentFailure(error: error.toString()));
    }
  }

  void checkPermissionAndUpdateCurrentLocation() async {
    await Geolocator.requestPermission();
    bool serviceEnabled = await LocationHelper.isServiceEnabled();
    bool serviceHavePermission = await LocationHelper.isServiceHavePermission();
    if (serviceEnabled && serviceHavePermission) {
      updateCurrentLocation();
    } else if (!serviceEnabled && serviceHavePermission) {
      updateCurrentLocation();
    } else if (serviceEnabled && !serviceHavePermission) {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return updateCurrentLocation();
          }
        },
      );
    } else {
      await LocationHelper.requestLocationPermission(
        onFinish: () async {
          bool serviceHavePermission =
              await LocationHelper.isServiceHavePermission();
          if (serviceHavePermission) {
            return updateCurrentLocation();
          }
        },
      );
    }
  }

  updateCurrentLocation() async {
    Position position = await LocationHelper.getCurrentPosition();
    LatLng currentLoc = LatLng(position.latitude, position.longitude);
    currentLocation = currentLoc;
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLoc, zoom: 15.0),
      ),
    );
  }

  void updateCameraPos({required LatLng pos}) async {
    currentLocation = pos;
    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: currentLocation!, zoom: 15.0),
      ),
    );
  }

  void onUpdateCamera({required CameraPosition position}) {
    currentLocation = position.target;
  }

  void onCloseCamera() async {
    try {
      Placemark placeMark = await LocationHelper.getLocationInfo(
        currentLocation!,
      );
      currentLocationName =
          "${placeMark.name}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}";
      emit(UpdateCameraLocation());
    } catch (error) {
      showToast(
        text: LocaleKeys.noInternetError.tr(),
        state: ToastStates.error,
      );
      emit(UpdateCameraFailure());
    }
  }

  SelectLocationParam getParam({required String serviceId}) {
    return SelectLocationParam(
      serviceId: serviceId,
      lat: currentLocation!.latitude.toString(),
      long: currentLocation!.longitude.toString(),
    );
  }

  void checkTechZone({
    required SelectLocationParam param,
    required BuildContext context,
  }) async {
    emit(CheckLocationTechLoading());
    var result = await repository.checkTechZone(param: param);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CheckLocationTechFailure());
      },
      (zoneLocationModel) {
        if (zoneLocationModel.isAllowTechInZone) {
          context.pushWithNamed(
            Routes.serviceDetailsView,
            arguments: ServiceDetailsArgument(
              address: currentLocationName!,
              serviceId: param.serviceId,
              lat: double.parse(param.lat),
              long: double.parse(param.long),
            ),
          );
        } else {
          showToast(text: zoneLocationModel.message, state: ToastStates.error);
        }
        emit(GetCurrentSuccess());
      },
    );
  }

  void updateLocation({
    required BuildContext context,
    String? address,
    File? avatar,
    int? method,
    int? perPage,
    bool navigateToHome = false,
  }) async {
    if (currentLocation == null) {
      showToast(text: 'Please select a location', state: ToastStates.error);
      return;
    }

    // For method 2, don't update user location - just use it for search
    final finalMethod = method ?? this.method;
    if (finalMethod != null && finalMethod == 2) {
      // Method 2: Just navigate to units page with selected location
      // Do NOT update user's personal location
      _navigateToUnitsWithLocation(context, finalMethod, perPage);
      return;
    }

    emit(UpdateLocationLoading());

    String? token = userCubit.token;
    if (token == null || token.isEmpty) {
      showToast(text: 'Please login first', state: ToastStates.error);
      emit(UpdateLocationFailure());
      return;
    }
    var result = await repository.updateLocation(
      param: UpdateLocationParam(
        lat: currentLocation!.latitude,
        long: currentLocation!.longitude,
        address: address ?? currentLocationName,
        avatar: avatar,
      ),
      token: token,
    );

    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(UpdateLocationFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        emit(UpdateLocationSuccess());

        // Update user address locally immediately using the address we just sent
        final currentUser = userCubit.user;
        if (currentUser != null && currentLocationName != null) {
          // Create updated user with new address using copyWith
          final updatedUser = currentUser.copyWith(
            lat: currentLocation!.latitude.toString(),
            long: currentLocation!.longitude.toString(),
            address: address ?? currentLocationName,
            hasLocation: true,
          );
          // Update UserCubit immediately with the new address
          userCubit.updateUser(updatedUser);
          debugPrint('User address updated locally: ${updatedUser.address}');
        }

        // Fetch updated user data from server to ensure everything is in sync
        _fetchAndUpdateUserThenNavigate(
          context,
          method: method,
          perPage: perPage,
          navigateToHome: navigateToHome,
        );
      },
    );
  }

  void _navigateToUnitsWithLocation(
    BuildContext context,
    int method,
    int? perPage,
  ) {
    if (currentLocation == null) {
      showToast(text: 'Please select a location', state: ToastStates.error);
      return;
    }
    final finalPerPage = perPage ?? this.perPage ?? 10;
    debugPrint('Navigating to homeUnitsResults with method: $method, perPage: $finalPerPage, lat: ${currentLocation!.latitude}, long: ${currentLocation!.longitude} (Method 2 - search only, no location update)');
    context.pushReplacementWithNamed(
      Routes.homeUnitsResults,
      arguments: {
        'method': method,
        'perPage': finalPerPage,
        'lat': currentLocation!.latitude,
        'long': currentLocation!.longitude,
      },
    );
  }

  Future<void> _fetchAndUpdateUserThenNavigate(
    BuildContext context, {
    int? method,
    int? perPage,
    bool navigateToHome = false,
  }) async {
    if (userCubit.token != null && userCubit.token!.isNotEmpty) {
      try {
        final userResult = await authRepository.authUser(
          token: userCubit.token!,
        );
        if (userResult.isRight()) {
          final updatedUser = userResult.getOrElse(
            () => throw Exception('No user data'),
          );
          await userCubit.updateUser(updatedUser);
        } else {
          print;
        }
      } catch (e) {
        print;
      }
    }

    await Future.delayed(const Duration(milliseconds: 200));
    if (context.mounted) {
      // Check if we should navigate to units results (from reservation CTA)
      // Use the stored method and perPage from cubit if not provided as parameters
      final finalMethod = method ?? this.method;
      final finalPerPage = perPage ?? this.perPage;
      
      if (finalMethod != null && finalPerPage != null && currentLocation != null) {
        // Method 1: Do not send lat/long (backend uses saved location)
        // Method 2: Must send lat/long (backend requires them)
        if (finalMethod == 1) {
          debugPrint('Navigating to homeUnitsResults with method: $finalMethod, perPage: $finalPerPage (no lat/long for Method 1)');
          context.pushReplacementWithNamed(
            Routes.homeUnitsResults,
            arguments: {
              'method': finalMethod,
              'perPage': finalPerPage,
              // Do NOT send lat or long for Method 1
            },
          );
        } else {
          // Method 2: Send lat/long (required)
          debugPrint('Navigating to homeUnitsResults with method: $finalMethod, perPage: $finalPerPage, lat: ${currentLocation!.latitude}, long: ${currentLocation!.longitude}');
          context.pushReplacementWithNamed(
            Routes.homeUnitsResults,
            arguments: {
              'method': finalMethod,
              'perPage': finalPerPage,
              'lat': currentLocation!.latitude,
              'long': currentLocation!.longitude,
            },
          );
        }
        return;
      }
      // Check if we should navigate to home (from registration)
      if (navigateToHome || this.navigateToHome) {
        context.pushReplacementWithNamed(Routes.homeView);
        return;
      }
      // Default: just pop back
      Navigator.pop(context);
    }
  }

  void skipLocationSelection({required BuildContext context}) async {
    if (isFromRegistration) {
      emit(UpdateLocationLoading());
      String? token = userCubit.token;
      if (token == null || token.isEmpty) {
        showToast(text: 'Please login first', state: ToastStates.error);
        emit(UpdateLocationFailure());
        return;
      }
      final currentUser = userCubit.user;
      if (currentUser == null) {
        showToast(text: 'User data not found', state: ToastStates.error);
        emit(UpdateLocationFailure());
        return;
      }
      final updatedUser = currentUser.copyWith(
        lat: null,
        long: null,
        address: null,
        hasLocation: false,
      );
      await userCubit.updateUser(updatedUser);
      authRepository.saveUserData(user: updatedUser, token: token);
      emit(UpdateLocationSuccess());
      await Future.delayed(const Duration(milliseconds: 200));

      if (context.mounted) {
        context.pushAndRemoveUntilWithNamed(Routes.homeView);
      }
    } else {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Future<void> close() {
    if (googleMapController != null) {
      googleMapController!.dispose();
    }
    searchLocationCtrl.dispose();
    return super.close();
  }
}
