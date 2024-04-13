import 'package:flutter/material.dart';

ThemeData getDarkMode() {
  return ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: FxColors.primary_Dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: FxColors.secondary_Dark,
      prefixStyle: const TextStyle(
        color: Colors.white,
      ),
      prefixIconColor: Colors.white,
      iconColor: Colors.white,
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: FxColors.primary_Dark,
    ),

    //
    scaffoldBackgroundColor: FxColors.background_Dark, //customScaffoldColor,
    splashColor: FxColors.primarySecondary_Dark, //customBackGroundBody
    primaryColor: FxColors.primary_Dark, //custom main
    shadowColor: FxColors.secondary_Dark,

    //
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'ios-3',
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'ios-1',
        // overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w500,
        color: Colors.white,
        // overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'ios-2',
        fontWeight: FontWeight.bold,
        // overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

ThemeData getLightMode() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: FxColors.background,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: FxColors.primarySecondary,
      prefixStyle: const TextStyle(
        color: Colors.white,
      ),
      prefixIconColor: FxColors.primary,
      iconColor: FxColors.primary,
    ),
    // fontFamily: 'ios-1',

    scaffoldBackgroundColor: FxColors.background, //customScaffoldColor,
    splashColor: FxColors.primarySecondary, //customBackGroundBody
    primaryColor: FxColors.primary, //custom main
    shadowColor: FxColors.secondary,
    //

    //
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
      headlineSmall: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'ios-3',
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'ios-1',
        // overflow: TextOverflow.ellipsis,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontFamily: 'ios-1',
        fontWeight: FontWeight.w500,
        color: Colors.black,
        // overflow: TextOverflow.ellipsis,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'ios-2',
        fontWeight: FontWeight.bold,
        // overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

TextStyle titleSmall(context) {
  return Theme.of(context).textTheme.titleSmall!;
}

TextStyle titleMedium(context) {
  return Theme.of(context).textTheme.titleMedium!;
}

TextStyle titleLarge(context) {
  return Theme.of(context).textTheme.titleLarge!;
}

class FxColors {
  static Color background = const Color(0xFFF6F5F2);
  static Color secondary = const Color(0xFFC58940);
  static Color primary = const Color(0xFFe7bb4e);
  static Color primarySecondary = const Color(0xFFFAEAB1);
  /////////////////////
  static Color background_Dark =
      Color.fromARGB(255, 123, 123, 123).withOpacity(0.2);
  static Color secondary_Dark =
      Color.fromARGB(255, 105, 105, 105).withOpacity(0.2);
  static Color primary_Dark = Color.fromARGB(255, 88, 88, 88).withOpacity(0.2);
  static Color primarySecondary_Dark =
      Color.fromARGB(255, 58, 61, 62).withOpacity(0.2);
}
