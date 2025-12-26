import 'dart:io';

import 'package:box_app/core/widgets/custom_toast.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class PermissionServices {
  Future<PermissionStatus> getContactsPermission() async {
    await Permission.contacts.request();
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted && permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.granted;
    } else {
      return permission;
    }
  }

  Future<bool> requestPermission(Permission permission, BuildContext context) async {
    if (permission == Permission.storage && Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt > 29) {
        return true;
      }
    }
    await permission.request();
    PermissionStatus permissionStatus = await permission.status;
    if (permissionStatus.isGranted) return true;
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      showToast(
        text: LocaleKeys.locationNotEnabled.tr(),
        state: ToastStates.error,
      );
      Future.delayed(const Duration(milliseconds: 1500), () {
        openAppSettings();
      });
      return false;
    }
    return true;
  }

  /// iOS-specific location permission check using Geolocator
  Future<bool> getIosLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint("Location service is not enabled");
      return false;
    }
    
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint("Location permission denied by user");
        return false;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      debugPrint("Location permission denied forever");
      return false;
    }
    
    return true;
  }

  /// Get current location with proper permission handling for both iOS and Android
  Future<LatLng?> getCurrentLocationWithPermission(BuildContext context) async {
    bool locationPermission;
    
    if (Platform.isIOS) {
      locationPermission = await getIosLocationPermission();
    } else {
      locationPermission = await requestPermission(Permission.location, context);
    }
    
    if (!locationPermission) {
      showToast(
        text: LocaleKeys.locationNotEnabled.tr(),
        state: ToastStates.error,
      );
      return null;
    }
    
    try {
      Position position = await Geolocator.getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      debugPrint("Error getting current position: $e");
      // Return default Saudi Arabia location as fallback
      return const LatLng(21.437273, 40.512714);
    }
  }
}
