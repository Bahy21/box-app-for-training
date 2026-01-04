import 'dart:io';

import 'package:box_app/api_verify_code/date/pin_code_argument.dart';
import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/framework/navigation_animation.dart';
import 'package:box_app/home/send_otp_page/send_otp_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.pinCodeView:
        // Extract phone from PinCodeArgument passed from previous page (e.g., LoginCubit)
        if (arguments == null || arguments is! PinCodeArgument) {
          throw ArgumentError(
            'pinCodeView route requires PinCodeArgument with phone number. '
            'Make sure to pass PinCodeArgument when navigating to this route.',
          );
        }
        final pinCodeArgument = arguments;
        return _buildRoute(
          builder: (_) => NextPage(phone: pinCodeArgument.phone),
        );
      default:
        return _buildRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }

  PageRoute _buildRoute({required WidgetBuilder builder}) {
    return Platform.isAndroid
        ? FadePageRoute(builder: builder)
        : MaterialPageRoute(builder: builder);
  }
}
