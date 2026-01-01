import 'package:box_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/contact_us/contact_us_import.dart';
import 'home/home_page_details/home_page_details_imports.dart';
import 'home/home_page_tap_bar/home_page_tap_bar_import.dart';
import 'home/submit_review/submit_review_import.dart';

void main() {
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
        return MaterialApp(
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
                if (supportedLocale.languageCode ==
                    locale.languageCode) {
                  return supportedLocale;
                }
              }
            }
            return const Locale('ar');
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
             home:HomeSplashScreen(),
         // home: Home(),
        //  home: ContactUs(),
       //   home: SubmitReview(),


        );
      },
    );
  }
}
