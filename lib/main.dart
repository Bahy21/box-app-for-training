import 'package:box_app/core/di/di.dart';
import 'package:box_app/core/util/routing/app_router.dart';
import 'package:box_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/register_page_folder/register/cubit/create_acc_user_cubit.dart' show CreateAccUserCubit;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();


  // Verify GetIt is working
  print('GetIt initialized: ${getIt.isRegistered<CreateAccUserCubit>()}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> appNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final appRouter = AppRouter();
        return MaterialApp(
          navigatorKey: MyApp.appNavigatorKey,
          locale: const Locale('ar'),
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale != null) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }
            }
            return const Locale('ar');
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeSplashScreen(),
          onGenerateRoute: appRouter.generateRoute,
         //  home: SelectLocationViewUI(),
          //  home: ContactUs(),
          //   home: SubmitReview(),
        );
      },
    );
  }
}
