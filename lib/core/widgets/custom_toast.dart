import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/constants/app_fonts.dart';
import 'package:box_app/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastStates { success, error, warning }

Color? toastColor(ToastStates state, BuildContext context) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = context.themeColors.primary;
      break;
    case ToastStates.error:
      color = context.themeColors.red;
      break;
    case ToastStates.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}

void showToast({
  required String text,
  required ToastStates state,
  BuildContext? context,
}) {
  final ctx = context ?? MyApp.appNavigatorKey.currentContext;
  if (ctx == null) return;

  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: toastColor(state, ctx),
    textColor: ctx.themeColors.textOnPrimary,
    fontAsset: "assets/fonts/DINNextLTArabic-Regular.ttf",
    fontSize: AppFonts.t15,
  );
}
