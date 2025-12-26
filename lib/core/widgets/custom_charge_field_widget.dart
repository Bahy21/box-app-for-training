import 'package:box_app/core/constants/app_text_styles.dart';
import 'package:box_app/core/framework/app_validator.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/media_query.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChargeFieldWidget extends StatelessWidget {
  final TextEditingController chargeNumCtrl;
  final GlobalKey<FormState> formKey;

  const CustomChargeFieldWidget({
    super.key,
    required this.chargeNumCtrl,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: Form(
        key: formKey,
        child: TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: AppValidator.walletValueValidator(),
          decoration: InputDecoration(
            isDense: true,
            hintStyle: AppTextStyles.textStyle12(
              context,
            ).copyWith(color: context.themeColors.unselected),
            hintText: LocaleKeys.enterValue.tr(),
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
            focusedBorder: buildUnderlineInputBorder(
              context,
              context.themeColors.selectedBorder,
            ),
            enabledBorder: buildUnderlineInputBorder(context),
            errorBorder: buildUnderlineInputBorder(
              context,
              context.themeColors.red,
            ),
            focusedErrorBorder: buildUnderlineInputBorder(
              context,
              context.themeColors.red,
            ),
            errorStyle: AppTextStyles.textStyle12(
              context,
            ).copyWith(color: context.themeColors.red),
            border: buildUnderlineInputBorder(context),
          ),
          controller: chargeNumCtrl,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorder(
    BuildContext context, [
    Color? color,
  ]) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color ?? context.themeColors.unselected),
    );
  }
}
