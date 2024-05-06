import 'package:MCC/routing/routes.dart';
import 'package:MCC/videos/categoryVideo.dart';
import 'package:MCC/views/OnbordingPage.dart';
import 'package:MCC/views/categories_screan.dart';
import 'package:MCC/views/signeupScreen.dart';
import 'package:MCC/views/loginScreen.dart';
import 'package:MCC/views/navpages/HomePage.dart';
import 'package:MCC/views/navpages/SettingsPage.dart';
import 'package:MCC/views/navpages/main_page.dart';
import 'package:MCC/views/selectLanguage.dart';
import 'package:flutter/material.dart';

String curRoute = '';

class Approuter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.selectLanguagePage:
        curRoute = Routes.selectLanguagePage;
        return MaterialPageRoute(
          builder: (_) => chooseLanguages(true),
        );
      case Routes.onboargingScreen:
        curRoute = Routes.onboargingScreen;

        return MaterialPageRoute(
          builder: (_) => onboardingPage(),
        );
      case Routes.homePage:
        curRoute = Routes.homePage;

        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case Routes.mainPage:
        curRoute = Routes.mainPage;

        return MaterialPageRoute(
          builder: (_) => mainpage(),
        );
      case Routes.categoriesScreen:
        curRoute = Routes.categoriesScreen;

        return MaterialPageRoute(
          builder: (_) => categoriesScreen(),
        );
      case Routes.settingsPage:
        curRoute = Routes.settingsPage;

        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      case Routes.LoginScreen:
        curRoute = Routes.LoginScreen;

        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.signeupScreen:
        curRoute = Routes.signeupScreen;

        return MaterialPageRoute(
          builder: (_) => SigneUpScreen(),
        );

      case Routes.Categoryvideo:
        curRoute = Routes.Categoryvideo;

        return MaterialPageRoute(
          builder: (_) => Categoryvideo(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
