import 'package:androidstudiommc/routing/routes.dart';
import 'package:androidstudiommc/views/OnbordingPage.dart';
import 'package:androidstudiommc/views/Service_detail_screen.dart';
import 'package:androidstudiommc/views/categories_screan.dart';
import 'package:androidstudiommc/views/categories_services_screans.dart';
import 'package:androidstudiommc/views/navpages/HomePage.dart';
import 'package:androidstudiommc/views/navpages/main_page.dart';
import 'package:androidstudiommc/views/selectLanguage.dart';
import 'package:flutter/material.dart';

class Approuter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.selectLanguagePage:
        return MaterialPageRoute(
          builder: (_) => chooseLanguages(),
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
      case Routes.ServiceDetailScreen:
        return MaterialPageRoute(
          builder: (_) => ServiceDetailScreen(),
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
