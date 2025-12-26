import 'package:box_app/core/constants/app_constants.dart';
import 'package:box_app/core/framework/spaces.dart';
import 'package:box_app/core/theme/theme_provider.dart';
import 'package:box_app/core/util/extensions/navigation.dart';
import 'package:box_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moyasar/moyasar.dart';

import 'custom_app_bar.dart';

class CustomBottomSheetPayWithMoyser extends StatelessWidget {
  final void Function() onPaidSuccess, onPaidFailed;
  final void Function({required String transactionId}) getTransactionId;
  final void Function()? onCancelled;
  final int price;
  final bool isIos;
  final String? description;

  const CustomBottomSheetPayWithMoyser({
    super.key,
    required this.onPaidSuccess,
    required this.onPaidFailed,
    required this.price,
    required this.getTransactionId,
    required this.isIos,
    this.description,
    this.onCancelled,
  });

  Widget _buildThemedCreditCard(BuildContext context) {
    // Force light theme for credit card widget (Moyasar uses hardcoded light colors)
    final creditCardTheme = ThemeData.light().copyWith(
      // Input decoration theme for TextFormFields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.grey[600]!, width: 2),
        ),
      ),
      // Text theme - light mode
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
      ),
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.blue[100],
          disabledForegroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          minimumSize: const Size.fromHeight(52),
        ),
      ),
      // Divider theme
      dividerTheme: const DividerThemeData(color: Colors.grey),
      // Color scheme - light
      colorScheme: ColorScheme.light(
        primary: Colors.blue[700]!,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
        error: Colors.red,
      ),
    );

    // Wrap with light background container for visibility in dark mode
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Theme(
        data: creditCardTheme,
        child: CreditCard(
          locale: context.locale.languageCode == "ar" ||
                  context.locale.languageCode == "ur"
              ? const Localization.ar()
              : const Localization.en(),
          config: PaymentConfig(
            publishableApiKey: AppConstants.moyserApiKey,
            amount: price,
            currency: 'SAR',
            description: description ?? 'Charge Wallet',
            creditCard: CreditCardConfig(
              saveCard: true,
              manual: false,
            ),
          ),
          onPaymentResult: (result) {
            if (result is PaymentResponse) {
              if (result.status == PaymentStatus.paid) {
                getTransactionId(transactionId: result.id.toString());
                context.pop();
                onPaidSuccess();
              } else if (result.status == PaymentStatus.authorized) {
                getTransactionId(transactionId: result.id.toString());
                context.pop();
                onPaidSuccess();
              } else if (result.status == PaymentStatus.failed) {
                onPaidFailed();
              } else {
                onPaidFailed();
              }
            } else if (result is ValidationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    LocaleKeys.invalidCreditCardInfo.tr(),
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 4),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    LocaleKeys.paymentErrorOccurred.tr(),
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
              onPaidFailed();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isIos == true
        ? PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            if (didPop) {
              onCancelled?.call();
            }
          },
          child: Container(
          decoration: BoxDecoration(
            color: context.themeColors.bottomSheetBackground,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20.r),
              topEnd: Radius.circular(20.r),
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
            child: Column(
              children: [
                ApplePay(
                  config: PaymentConfig(
                    publishableApiKey: AppConstants.moyserApiKey,
                    // publishableApiKey: AppConstants.moyserApiKeyLive,
                    amount: price,
                    description: description ?? 'Charge Wallet',
                    applePay: ApplePayConfig(
                      label: LocaleKeys.appName.tr(),
                      merchantId: 'merchant.com.linkdevelopment.box.app',
                      manual: false,
                      saveCard: true,
                    ),
                  ),
                  onPaymentResult: (result) {
                    if (result is PaymentResponse) {
                      if (result.status == PaymentStatus.paid) {
                        getTransactionId(transactionId: result.id.toString());
                        context.pop();
                        onPaidSuccess();
                      } else if (result.status == PaymentStatus.failed) {
                        onPaidFailed();
                      }
                    }
                  },
                ),
                heightSpace(10.h),
              ],
            ),
          ),
          ),
        )
        : PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            if (didPop) {
              onCancelled?.call();
            }
          },
          child: Container(
            margin: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: BoxDecoration(
              color: context.themeColors.bottomSheetBackground,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20.r),
                topEnd: Radius.circular(20.r),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    context: context,
                    textAppBar: LocaleKeys.payment.tr(),
                    textColor: context.themeColors.primary,
                  ),
                  heightSpace(12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: _buildThemedCreditCard(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
