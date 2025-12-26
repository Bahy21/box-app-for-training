// import 'dart:io';
//
// import 'package:box_app/core/di/di.dart';
// import 'package:box_app/core/framework/navigation_animation.dart';
// import 'package:box_app/core/util/routing/routes.dart';
//
// // Updated imports after moving my_orders from common to features
// // import 'package:box_app/features/common/my_orders/presentation/views/booking_details_view.dart';
// // import 'package:box_app/features/common/my_orders/presentation/views/active_booking_details_view.dart';
// // import 'package:box_app/features/common/my_orders/presentation/views/completed_booking_details_view.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class AppRouter {
//   Route generateRoute(RouteSettings settings) {
//     final arguments = settings.arguments;
//     switch (settings.name) {
//       case Routes.splashView:
//         return _buildRoute(
//           builder:
//               (context) => BlocProvider(
//                 create: (context) => getIt<SplashCubit>(),
//                 child: const SplashView(),
//               ),
//         );
//       case Routes.selectLanguageView:
//         return _buildRoute(
//           builder:
//               (context) => BlocProvider(
//                 create: (context) => getIt<SelectLanguageCubit>(),
//                 child: const SelectLanguageView(),
//               ),
//         );
//       case Routes.loginView:
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<LoginCubit>(),
//                 child: const LoginView(),
//               ),
//         );
//       case Routes.termsAndCondView:
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<TermsAndCondCubit>(),
//                 child: const TermsAndCondView(),
//               ),
//         );
//       case Routes.privacyView:
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<PrivacyCubit>(),
//                 child: const PrivacyView(),
//               ),
//         );
//       case Routes.helpCenterView:
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<HelpCenterCubit>(),
//                 child: const HelpCenterView(),
//               ),
//         );
//       case Routes.whoAreWe:
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<WhoAreWeCubit>(),
//                 child: const WhoAreWeView(),
//               ),
//         );
//       case Routes.selectLocationView:
//         final argument = arguments as SelectLocationArgument;
//         return _buildRoute(
//           builder:
//               (_) => MultiBlocProvider(
//                 providers: [
//                   BlocProvider(create: (context) => getIt<SearchPlacesBloc>()),
//                   BlocProvider(
//                     create: (context) => getIt<SelectLocationCubit>(),
//                   ),
//                 ],
//                 child: SelectLocationView(argument: argument),
//               ),
//         );
//       case Routes.bookingDetailsView:
//         final reservationId = arguments is int ? arguments : null;
//         return _buildRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => getIt<MyOrdersCubit>(),
//             child: BookingDetailsView(reservationId: reservationId),
//           ),
//         );
//       case Routes.activeBookingDetailsView:
//         final reservationId = arguments is int ? arguments : null;
//         return _buildRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => getIt<MyOrdersCubit>(),
//             child: ActiveBookingDetailsView(reservationId: reservationId),
//           ),
//         );
//       case Routes.completedBookingDetailsView:
//         final reservationId = arguments is int ? arguments : null;
//         return _buildRoute(
//           builder: (_) => BlocProvider(
//             create: (context) => getIt<MyOrdersCubit>(),
//             child: CompletedBookingDetailsView(reservationId: reservationId),
//           ),
//         );
//       case Routes.pinCodeView:
//         final argument = arguments as PinCodeArgument;
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<PinCodeCubit>(),
//                 child: PinCodeView(argument: argument),
//               ),
//         );
//       case Routes.pinCodeSuccessView:
//         final onDonePressed = arguments as VoidCallback;
//         return _buildRoute(
//           builder: (_) => PinCodeSuccessView(onDonePressed: onDonePressed),
//         );
//       case Routes.homeView:
//         final initialTabIndex = arguments as int? ?? 0;
//         return _buildRoute(
//           builder: (_) => Home(initialTabIndex: initialTabIndex),
//         );
//       case Routes.homeUnitsResults:
//         final args = settings.arguments as Map<String, dynamic>?;
//         return _buildRoute(
//           builder: (context) => HomeUnitsResult(
//             method: args?['method'] ?? 1,
//             lat: args?['lat'] as double?,
//             long: args?['long'] as double?,
//             perPage: args?['perPage'] as int?,
//           ),
//         );
//       case Routes.unitDetails:
//         final unitId = settings.arguments as String? ?? '';
//         return _buildRoute(
//           builder: (context) {
//             final cubit = getIt<UnitDetailsCubit>();
//             if (unitId.isNotEmpty) {
//               cubit.fetchUnitDetails(unitId: unitId);
//               cubit.fetchUnitAvailability(unitId: unitId);
//             }
//             return BlocProvider.value(
//               value: cubit,
//               child: const UnitDetails(),
//             );
//           },
//         );
//       case Routes.unitReviews:
//         final unitId = settings.arguments as int?;
//         return _buildRoute(
//           builder: (context) {
//             final reviewsCubit = getIt<UnitReviewsCubit>();
//             final unitDetailsCubit = getIt<UnitDetailsCubit>();
//             if (unitId != null) {
//               reviewsCubit.fetchReviews(unitId: unitId);
//               // Fetch unit details if not already loaded
//               if (unitDetailsCubit.unitDetails == null ||
//                   unitDetailsCubit.unitDetails?.id != unitId) {
//                 unitDetailsCubit.fetchUnitDetails(unitId: unitId.toString());
//               }
//             }
//             return MultiBlocProvider(
//               providers: [
//                 BlocProvider.value(value: reviewsCubit),
//                 BlocProvider.value(value: unitDetailsCubit),
//               ],
//               child: const UnitReviews(),
//             );
//           },
//         );
//       case Routes.loyaltyPointsView:
//         return _buildRoute(builder: (_) => const LoyaltyPointsView());
//       case Routes.nafathVerificationView:
//         return _buildRoute(builder: (_) => const NafathVerificationView());
//       case Routes.faqView:
//         return _buildRoute(builder: (_) => const FaqView());
//       case Routes.contactUsView:
//         return _buildRoute(builder: (_) => const ContactUsView());
//       case Routes.rechargeWallet:
//         return _buildRoute(builder: (_) => const RechargeWallet());
//       case Routes.editProfileView:
//         return _buildRoute(
//           builder: (_) => const EditProfileView(),
//         );
//       case Routes.createAccUserView:
//         final argument = arguments as CreateAccArgument;
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<CreateAccUserCubit>(),
//                 child: CreateAccUserView(argument: argument),
//               ),
//         );
//       case Routes.bookingStepOne:
//         final args = settings.arguments as BookingArguments;
//         return _buildRoute(builder: (_) => BookingStepOneView(arguments: args));
//       case Routes.bookingPayment:
//         final args = settings.arguments as PaymentArguments;
//         return _buildRoute(builder: (_) => BookingPaymentView(arguments: args));
//       case Routes.notificationsView:
//         return _buildRoute(
//           builder:
//               (_) => BlocProvider(
//                 create: (context) => getIt<NotificationsCubit>(),
//                 child: const NotificationsView(),
//               ),
//         );
//       default:
//         return _buildRoute(
//           builder:
//               (_) => Scaffold(
//                 body: Center(
//                   child: Text('No route defined for ${settings.name}'),
//                 ),
//               ),
//         );
//     }
//   }
//
//   PageRoute _buildRoute({required WidgetBuilder builder}) {
//     return Platform.isAndroid
//         ? FadePageRoute(builder: builder)
//         : MaterialPageRoute(builder: builder);
//   }
// }
