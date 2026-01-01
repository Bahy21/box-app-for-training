import 'dart:io';

import 'package:box_app/core/util/routing/routes.dart';
import 'package:box_app/core/framework/navigation_animation.dart';
import 'package:box_app/home/send_otp_page/send_otp_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.pinCodeView:
        return _buildRoute(
          builder: (_) => const NextPage(),
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
