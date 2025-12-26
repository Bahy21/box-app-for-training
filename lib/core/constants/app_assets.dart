import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../framework/theme_cubit.dart';

class AppAssets {
  static const String _iconsPath = "assets/images/icons";
  static const String icons = "assets/icons";
  static const String logo = "$_iconsPath/logo.svg";
  static const String arrow = "$_iconsPath/arrow.svg";
  static const String arrowBack = "$_iconsPath/arrow_back.svg";

  static bool _isDarkMode(BuildContext context) =>
      context.read<ThemeCubit>().isDarkMode;
  static String backArrowAsset(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark
        ? "$_iconsPath/white_back_arrow.svg"
        : "$_iconsPath/arrow_back.svg";
  }

  static bool shouldFlipBackArrow(BuildContext context) {
    return Directionality.of(context) == TextDirection.ltr;
  }

  static String searchIcon(bool isDarkMode) =>
      isDarkMode ? "$icons/search_white.svg" : "$icons/search_black.svg";
  static String detectedLocation(bool isDarkMode) =>
      isDarkMode ? "$icons/location_white.svg" : "$icons/location_black.svg";
  static String comfortLogoSplash(bool isDarkMode) =>
      isDarkMode ? "$icons/comfort_logo_dark.svg" : logo;
  static String notificationIcon(bool isDarkMode) =>
      isDarkMode ? "$icons/notification_dark.svg" : "$icons/notification.svg";
  static String darkLightCalender(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? calenderDark : calenderIcon;
  }

  static String lightDarkCalender(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return !isDark ? calenderDark : calenderIcon;
  }

  static String darkLightTime(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? timeDark : time;
  }

  static String paymentWalletIcon(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? "$icons/wallet_dark.svg" : "$icons/wallet_light_mode.svg";
  }

  static String paymentWallet(bool isDarkMode) {
    return isDarkMode
        ? "$icons/wallet_dark.svg"
        : "$icons/wallet_light_mode.svg";
  }

  static String paymentCreditCardIcon(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark
        ? "$icons/credit-card_dark.svg"
        : "$icons/credit-card_light_mode.svg";
  }

  static String paymentCreditCard(bool isDarkMode) {
    return isDarkMode
        ? "$icons/credit-card_dark.svg"
        : "$icons/credit-card_light_mode.svg";
  }

  static String paymentApplePayIcon(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark
        ? "$icons/apple-pay_dark.svg"
        : "$icons/apple-pay_light_mode.svg";
  }

  static String paymentApplePay(bool isDarkMode) {
    return isDarkMode
        ? "$icons/apple-pay_dark.svg"
        : "$icons/apple-pay_light_mode.svg";
  }

  static const String arrowUp = "$_iconsPath/arrow_up.svg";
  static const String position = "$icons/gps.svg";
  static const String arrowDown = "$_iconsPath/arrow_down.svg";
  static const String arrowForward = "$icons/arrow_forward.svg";
  //arrowLight
  static const String arrowLight = "$icons/arrowLight.svg";
  //arrowDark
  static const String arrowDark = "$icons/arrowDark.svg";
  static const String saudiFlag = "$_iconsPath/saudi_flag.svg";
  static const String sa = "$_iconsPath/saudi.svg";
  static const String united = "$_iconsPath/united.svg";
  static  String noNotifications(bool isDarkMode) =>isDarkMode?"$icons/no_notifications_dark.svg" : "$icons/no_notifications_light.svg";
  static const String wallet = "$_iconsPath/wallet.svg";
  static const String calender = "$_iconsPath/calendar.svg";
  static const String time = "$_iconsPath/time.svg";
  static const String timeDark = "$_iconsPath/timeDark.svg";
  static const String location = "$_iconsPath/location.svg";
  static const String close = "$_iconsPath/close.svg";
  static const String notification = "$icons/notification.svg";
  static const String language = "$_iconsPath/languages.svg";
  static const String privacy = "$_iconsPath/privacy.svg";
  static const String visitor = "$_iconsPath/visitor.svg";
  static const String money = "$_iconsPath/money.svg";
  static const String camera = "$_iconsPath/camera.svg";
  static const String delete = "$_iconsPath/delete.svg";
  static const String fanniLoading = "$_iconsPath/fanni_almohtarif_loading.gif";
  static const String noInternet = "$_iconsPath/no_internet.svg";
  static const String noImage = "$_iconsPath/no_image.svg";
  static const String defaultError = "$_iconsPath/default_error.svg";
  static const String emptyData = "$_iconsPath/empty_data.svg";
  static const String unAuthenticated = "$_iconsPath/un_authenticated.svg";
  static const String attachCamera = "$_iconsPath/attach_camera.svg";
  static const String gallery = "$_iconsPath/gallery.svg";

  static const String verified = "$icons/verification.svg";
  static const String locationIcon = "$icons/location.svg";
  static const String dropDown = "$icons/down-arrow.svg";
  static const String doorLock = "$_iconsPath/door-lock.svg";
  static const String calenderIcon = "$_iconsPath/calenderLight.svg";
  static const String calenderDark = "$_iconsPath/calenderDark.svg";
  static const String switchSvg = "$_iconsPath/switch.svg";
  //log-out.svg
  static const String logOut = "$_iconsPath/log-out.svg";
  //log-out-dark.svg
  static const String logOutDark = "$_iconsPath/log-out-darkk.svg";

  static String logOutIcon(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? logOutDark : logOut;
  }

  //verification.svg
  static const String verification = "$_iconsPath/verification.svg";
  static const String reyal = "$icons/reyal.svg";
  static const String whiteCalender = "$icons/calendar-white.svg";
  static const String star = "$_iconsPath/star.svg";
  static const String map = "$_iconsPath/mapLight.svg";
  static const String mapDark = "$_iconsPath/mapDark.svg";
  static const String moneyIcon = "$icons/money.svg";
  static const String comfortLogo = "$icons/small_comfort_logo.svg";
  //settings_comfort_logo_light.svg
  static const String settingsComfortLogoLight =
      "$_settingsIconsLightPath/settings_comfort_logo_light.svg";
  //settings_comfort_logo_dark. svg
  static const String settingsComfortLogoDark =
      "$_settingsIconsDarkPath/settings_comfort_logo_dark.svg";
  //settings_contract_light.svg
  static const String settingsContractLight =
      "$icons/settings_contract_light.svg";
  //settings_contract_dark.svg
  static const String settingsContractDark =
      "$icons/settings_contract_dark.svg";
  //settings_customer_light.svg
  static const String walletWhite = "$_iconsPath/walletWhite.svg";
  static const String walletBlack = "$_iconsPath/walletDark.svg";
  static const String transferMoneyLight =
      "$_iconsPath/transfer-money-light.svg";
  static const String transferMoneyDark = "$_iconsPath/transfer-money-dark.svg";

  static const String noPreviousTransactionsLight =
      "$_iconsPath/no-previous-transactions-light.svg";
  static const String noPreviousTransactionsDark =
      "$_iconsPath/no-previous-transactions-dark.svg";

  static String noPreviousTransactions(bool isDarkMode) =>
      isDarkMode ? noPreviousTransactionsDark : noPreviousTransactionsLight;
  static const String contract = "$icons/contract.svg";
  static const String customer = "$icons/customer.svg";
  static const String faq = "$icons/faq.svg";
  static const String privacyPolicy = "$icons/privacy.svg";
  static const String switchIcon = "$icons/switch.svg";
  static const String deleteIcon = "$icons/delete.svg";
  static const String languageIcon = "$icons/language.svg";
  static const String loyaltyPoints = "$icons/loyalty_points.svg";
  static const String cameraIcon = "$_iconsPath/camera.svg";
  //camera-dark.svg
  static const String cameraIconDark = "$_iconsPath/camera-dark.svg";
  static String cameraIconAsset(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? cameraIconDark : cameraIcon;
  }
  static const String rightCheck = "$icons/right.svg";
  static const String transferMoney = "$icons/transfer-money.svg";
  static const String recharge = "$icons/recharge.svg";
  static const String walletLogo = "$icons/wallet_logo.svg";
  static const String whiteReyal = "$icons/white_reyal.svg";
  static const String rechargeWallet = "$_iconsPath/recharge_wallet.svg";
  //recharge_wallet_dark
  static const String rechargeWalletDark =
      "$_iconsPath/recharge_wallet_dark.svg";
  //recharge_wallet_light
  static const String rechargeWalletLight = "$_iconsPath/recharge_wallet.svg";
  //recharge_wallet
  static String rechargeWalletIcon(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? rechargeWalletDark : rechargeWalletLight;
  }

  static String mapIcon(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? mapDark : map;
  }

  static const String theme = "$icons/theme.svg";
  static const String darkComfortLogo = "$icons/dark_comfort_logo.svg";
  static const String nafathSeekLogo = "$_iconsPath/nafath_seeklogo.svg";
  static const String currentLocation = "$_iconsPath/current_location.svg";
  static const String marker = "$_iconsPath/map_marker.svg";
  static const String shieldUserFill = "$icons/shield-user-fill.svg";

  static const String masterCard = "$_iconsPath/master-card.png";
  static const String mada = "$_iconsPath/mada-logo.png";
  static const String visa = "$_iconsPath/visa.png";
  static const String american = "$_iconsPath/american.png";
  static const String applePay = "$_iconsPath/apple-pay.svg";
  static const String creditCard = "$_iconsPath/credit-card.svg";

  static const String calenderIconSvg = "$icons/calender_icon_svg.svg";
  static const String realSaudiIconSvg = "$icons/real_saudi.svg";
  static const String noReservationsIconSvg = "$icons/no_reservations_icon.svg";
  static const String mapThumnal = "$icons/mapThumnal.svg";
  static const String mapThumnalPng = "$icons/mapThumnal.png";
  static const String logoSmall = "$icons/small_comfort_logo.svg";
  static const String verificationIllustrator =
      "$icons/verification_illustrator.svg";
  static const String moneySvg = "$_iconsPath/moneySvg.svg";

  //moneySvgWhite
  static const String moneySvgWhite = "$_iconsPath/moneySvgWhite.svg";
  //moneySvgRed
  static String moneySvgIcon(BuildContext context) {
    final bool isDark = _isDarkMode(context);
    return isDark ? moneySvgWhite : moneySvg;
  }

  static const String moneySvgRed = "$_iconsPath/moneySvgRed.svg";

  static String walletIcon(BuildContext context) {
    final bool isDark = _isDarkMode(context);
    return isDark ? walletWhite : walletBlack;
  }

  static String transferMoneyIcon(BuildContext context) {
    final bool isDark = _isDarkMode(context);
    return isDark ? transferMoneyDark : transferMoneyLight;
  }

  static String moneyTransactionIcon(
    BuildContext context, {
    bool isPositive = true,
  }) {
    if (!isPositive) return moneySvgRed;
    final bool isDark = _isDarkMode(context);
    return isDark ? moneySvgWhite : moneySvg;
  }

  static String amountIndicatorIcon(BuildContext context, bool isPositive) =>
      isPositive ? moneyTransactionIcon(context) : moneySvgRed;

  static const String home = "$_iconsPath/home.svg";
  static const String calendar = "$_iconsPath/calendar.svg";
  static const String walletHome = "$_iconsPath/wallet.svg";
  static const String more = "$_iconsPath/more.svg";
  static const String starRate = "$icons/star-rate.svg";
  static const String outLinedWallet = "$icons/outlined_wallet.svg";

  static const String settingsDelete = "assets/images/icons/delete.svg";
  static const String settingsSwitch = "assets/images/icons/switch.svg";

  static const String _settingsIconsLightPath = "assets/icons/settings/light";
  static const String _settingsIconsDarkPath = "assets/icons/settings/dark";
  //wallet-top-up-dark
  static const String walletTopUpDark = "$_iconsPath/wallet-top-up-dark.svg";
  //wallet-top-up-light
  static const String walletTopUpLight = "$_iconsPath/wallet-top-up-light.svg";
  //location.png
  static const String locationIconDark = "$_iconsPath/location.png";
  static const String locationIconLight = "$_iconsPath/locationLight.png";

  static String locationIconAsset(BuildContext context) {
    final bool isDark = context.read<ThemeCubit>().isDarkMode;
    return isDark ? locationIconDark : locationIconLight;
  }

  //wallet-top-up
  //mapThum
  static const String mapThumbnail = "$_iconsPath/mapThum.png";
  static String walletTopUpIcon(BuildContext context) {
    final bool isDark = _isDarkMode(context);
    return isDark ? walletTopUpDark : walletTopUpLight;
  }

  static String _settingsIconPath(String baseName, bool isDarkMode) {
    final suffix = isDarkMode ? "dark" : "light";
    final basePath =
        isDarkMode ? _settingsIconsDarkPath : _settingsIconsLightPath;
    return "$basePath/${baseName}_$suffix.svg";
  }

  static String settingsComfortLogoIcon(bool isDarkMode) =>
      _settingsIconPath("settings_comfort_logo", isDarkMode);
  static String settingsContractIcon(bool isDarkMode) =>
      _settingsIconPath("settings_contract", isDarkMode);
  static String settingsCustomerIcon(bool isDarkMode) =>
      _settingsIconPath("settings_customer", isDarkMode);
  static String settingsFaqIcon(bool isDarkMode) =>
      _settingsIconPath("settings_faq", isDarkMode);
  static String settingsPaletteIcon(bool isDarkMode) =>
      _settingsIconPath("settings_palette", isDarkMode);
  static String settingsLanguageIcon(bool isDarkMode) =>
      _settingsIconPath("settings_language", isDarkMode);
  static String settingsNotificationIcon(bool isDarkMode) =>
      _settingsIconPath("settings_notification", isDarkMode);
  static String settingsPrivacyIcon(bool isDarkMode) =>
      _settingsIconPath("settings_privacy", isDarkMode);
  static String loyaltyIcons(bool isDarkMode) {
    // Special case: money icon is named "money.svg" without "_dark" or "_light" suffix
    final basePath =
        isDarkMode ? _settingsIconsDarkPath : _settingsIconsLightPath;
    return "$basePath/money.svg";
  }
  
  static String settingsLoyaltyIcon(bool isDarkMode) {
    // Special case: dark mode file is named "settings_loyalty.svg" without "_dark" suffix
    if (isDarkMode) {
      return "$_settingsIconsDarkPath/settings_loyalty.svg";
    }
    return _settingsIconPath("settings_loyalty", isDarkMode);
  }

  // No reviews icons
  static const String noReviewsLight = "$icons/no_reviews_light.svg";
  static const String noReviewsDark = "$icons/no_reviews_dark.svg";

  static String noReviewsIcon(BuildContext context) {
    final bool isDark = _isDarkMode(context);
    return isDark ? noReviewsDark : noReviewsLight;
  }
}
