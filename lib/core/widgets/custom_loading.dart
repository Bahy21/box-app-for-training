import 'dart:math' as math;

import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoading extends StatelessWidget {
  final bool? isButton, isLogo;
  final double? heightLoading, widthLoading, strokeWidth;

  const CustomLoading({
    super.key,
    this.isButton = false,
    this.isLogo = true,
    this.heightLoading,
    this.widthLoading,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return isButton == true
        ? SizedBox(
          height: heightLoading ?? 20.h,
          width: widthLoading ?? 20.w,
          child: CircularProgressIndicator(
            color: context.themeColors.selectedBorder,
            strokeWidth: strokeWidth ?? 4.w,
          ),
        )
        : isLogo == true
        ? SizedBox(
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LoadingSpinner(
                size: heightLoading ?? widthLoading ?? 120.w,
                color: context.themeColors.primary,
                strokeWidth: strokeWidth ?? 9.w,
              ),
              heightSpace(9.h),
              Text(
                LocaleKeys.loading.tr(),
                style: AppTextStyles.textStyle14(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.themeColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
        : SizedBox(
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LoadingSpinner(
                size: heightLoading ?? widthLoading ?? 80.w,
                color: context.themeColors.primary,
                strokeWidth: strokeWidth ?? 8.w,
              ),
              heightSpace(9.h),
              Text(
                LocaleKeys.loading.tr(),
                style: AppTextStyles.textStyle14(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.themeColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
  }
}

class _LoadingSpinner extends StatefulWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const _LoadingSpinner({
    required this.size,
    required this.color,
    required this.strokeWidth,
  });

  @override
  State<_LoadingSpinner> createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<_LoadingSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double angle = _controller.value * 2 * math.pi;
          return Transform.rotate(
            angle: angle,
            child: CustomPaint(
              painter: _LoadingSpinnerPainter(
                color: widget.color,
                strokeWidth: widget.strokeWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoadingSpinnerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  const _LoadingSpinnerPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double outerRadius = size.shortestSide / 2;
    final double innerRadius = outerRadius * 0.45;
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    const int spokes = 8;
    for (int i = 0; i < spokes; i++) {
      final double angle = (2 * math.pi / spokes) * i;
      final Offset start = Offset(
        center.dx + innerRadius * math.cos(angle),
        center.dy + innerRadius * math.sin(angle),
      );
      final Offset end = Offset(
        center.dx + outerRadius * math.cos(angle),
        center.dy + outerRadius * math.sin(angle),
      );

      final double opacityFactor = math.min(
        1,
        math.max(0.35, 0.35 + (i / spokes) * 0.65),
      );
      canvas.drawLine(
        start,
        end,
        paint..color = color.withOpacity(opacityFactor),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _LoadingSpinnerPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.strokeWidth != strokeWidth;
  }
}
