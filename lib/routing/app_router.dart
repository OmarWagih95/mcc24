import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/OnbordingPage.dart';
import 'package:MCC/views/Service_detail_screen.dart';
import 'package:MCC/views/categories_screan.dart';
import 'package:MCC/views/categories_services_screans.dart';
import 'package:MCC/views/signeupScreen.dart';
import 'package:MCC/views/loginScreen.dart';
import 'package:MCC/views/navpages/HomePage.dart';
import 'package:MCC/views/navpages/SettingsPage.dart';
import 'package:MCC/views/navpages/main_page.dart';
import 'package:MCC/views/selectLanguage.dart';
import 'package:flutter/material.dart';

class Approuter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.selectLanguagePage:
        return MaterialPageRoute(
          builder: (_) => chooseLanguages(true),
        );
      case Routes.onboargingScreen:
        return MaterialPageRoute(
          builder: (_) => onboardingPage(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case Routes.mainPage:
        return MaterialPageRoute(
          builder: (_) => const mainpage(),
        );
      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (_) => categoriesScreen(),
        );
      // case Routes.ServiceDetailScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => ServiceDetailScreen(),
      //   );
      case Routes.settingsPage:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );
      case Routes.LoginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ); case Routes.signeupScreen:
        return MaterialPageRoute(
          builder: (_) => SigneUpScreen(),
        );
      // case Routes.CategoryserviceScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => CategoryserviceScreen(
      //       available_Services: [],
      //       l: [],
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
