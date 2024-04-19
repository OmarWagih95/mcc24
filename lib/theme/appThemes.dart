import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

enum ToolAppThemeType { light, dark }

ThemeData getDarkTheme() => ThemeData(

    ///Colors
    scaffoldBackgroundColor: FxColors.background_Dark, //customScaffoldColor,
    splashColor: FxColors.primarySecondary_Dark, //customBackGroundBody
    primaryColor: FxColors.primary_Dark, //custom main
    primaryColorLight: FxColors.secondary_Dark,
    hoverColor: FxColors.primary,
    cardColor: FxColors.secondary,

    shadowColor: FxColors.secondary_Dark,
    brightness: Brightness.dark,

    ///dividerTheme
    dividerColor: Colors.grey.withOpacity(0.5),
    dividerTheme: DividerThemeData(
      thickness: 1,
      color: Colors.grey.withOpacity(0.5),
    ),
    useMaterial3: true,
    drawerTheme: DrawerThemeData(
      backgroundColor: FxColors.secondary_Dark,

    ),

    ///AppBarTheme
    appBarTheme: AppBarTheme(
      foregroundColor: FxColors.background_Dark,
      surfaceTintColor: FxColors.background_Dark,
      shadowColor: FxColors.background_Dark,
      elevation: 0,
      color: FxColors.primarySecondary_Dark,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,

        // fontFamily: isDark ? AssetsEnFonts.medium : AssetsArFonts.medium,
        fontSize: 22,
      ),
    ),

    ///iconTheme
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 30,
    ),

    ///bottom AppBar Theme
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      elevation: 2,
    ),

    ///tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      labelColor: Colors.white,
      dividerColor: FxColors.background,
      indicatorColor: FxColors.background,
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      unselectedLabelColor: Colors.grey,
      indicator: const UnderlineTabIndicator(),
      indicatorSize: TabBarIndicatorSize.tab,
    ),

    ///Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),

      labelStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),

      suffixStyle: const TextStyle(
        color: Colors.grey,
      ),
      prefixStyle: const TextStyle(
        color: Colors.grey,
      ),
      // fillColor: DarkColors.lapel,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          // color: FxColors.third,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: FxColors.secondary,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    //text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        enableFeedback: false,
        elevation: 0,
        textStyle: TextStyle(
          color: FxColors.primary,
          fontSize: 16,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        enableFeedback: false,
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: FxColors.primary,
          width: 2,
        ),
        padding: const EdgeInsets.all(4),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    //elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        enableFeedback: false,
        alignment: Alignment.center,
        backgroundColor: FxColors.primary,
        padding: const EdgeInsets.all(4),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),

    ///iconButtonTheme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        enableFeedback: false,
        elevation: 0,
        iconSize: 35,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: FxColors.primary,
      elevation: 0,
      iconSize: 35,
    ),

    //bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    ),
    //dialog Theme
    dialogTheme: DialogTheme(
      backgroundColor: const Color(0xff1F222A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(circularTrackColor: FxColors.primary),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'ios-1',
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
        color: Colors.white60,
        fontWeight: FontWeight.bold,
        fontSize: 14,
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
        color: FxColors.primary,
        fontSize: 25,
        fontFamily: 'ios-2',
        fontWeight: FontWeight.bold,
        // overflow: TextOverflow.ellipsis,
      ),
    ),
    //bottomNavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: FxColors.primarySecondary,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: FxColors.primarySecondary),
      unselectedIconTheme: IconThemeData(color: FxColors.secondary),
      unselectedItemColor: FxColors.primarySecondary,
      selectedLabelStyle: TextStyle(
        backgroundColor: FxColors.primary,
        color: FxColors.secondary,
      ),
      unselectedLabelStyle: TextStyle(
        backgroundColor: FxColors.primary,
        color: FxColors.secondary,
      ),
      showSelectedLabels: null,
      showUnselectedLabels: null,
      type: BottomNavigationBarType.shifting,
    ));
ThemeData getlightTheme() => ThemeData(

    ///Colors
    //
    scaffoldBackgroundColor: FxColors.background, //customScaffoldColor,
    splashColor: FxColors.primarySecondary, //customBackGroundBody
    primaryColor: FxColors.primary, //custom main
    primaryColorLight: FxColors.secondary,
    shadowColor: FxColors.secondary,
    brightness: Brightness.light,


    ///dividerTheme
    // dividerColor: Colors.grey.withOpacity(0.5),
    // dividerTheme: DividerThemeData(
    //   thickness: 1,
    //   color: Colors.grey.withOpacity(0.5),
    // ),
    useMaterial3: true,
    drawerTheme: DrawerThemeData(
      backgroundColor: FxColors.secondary,
    ),


    ///AppBarTheme
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: FxColors.secondary),
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 0,
      color: Colors.white,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(
        color: FxColors.secondary,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: FxColors.secondary,

        // fontFamily: isDark ? AssetsEnFonts.medium : AssetsArFonts.medium,
        fontSize: 22,
      ),
    ),

    ///iconTheme
    iconTheme: IconThemeData(
      color: FxColors.primary_Dark,
      size: 30,
    ),

    ///bottom AppBar Theme
    bottomAppBarTheme: BottomAppBarTheme(
      color: FxColors.secondary,
      elevation: 2,
    ),

    ///tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      labelColor: Colors.white,
      dividerColor: FxColors.background,
      indicatorColor: FxColors.background,
      unselectedLabelStyle: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      unselectedLabelColor: FxColors.primary,
      indicator: const UnderlineTabIndicator(),
      indicatorSize: TabBarIndicatorSize.tab,
    ),

    ///Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white
      ,errorStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),


      labelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),

      suffixStyle: const TextStyle(
        color: Colors.black,
      ),
      prefixStyle: const TextStyle(
        color: Colors.black,
      ),
      // fillColor: DarkColors.lapel,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          // color: FxColors.third,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: FxColors.secondary,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    //text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        enableFeedback: false,
        elevation: 0,
        textStyle: TextStyle(
          color: FxColors.primary,
          fontSize: 16,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        enableFeedback: false,
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: FxColors.primary,
          width: 2,
        ),
        padding: const EdgeInsets.all(4),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    //elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        enableFeedback: false,
        alignment: Alignment.center,
        backgroundColor: FxColors.primary,
        padding: const EdgeInsets.all(4),
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),

    ///iconButtonTheme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        enableFeedback: false,
        elevation: 0,
        iconSize: 35,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: FxColors.primary,
      elevation: 0,
      iconSize: 35,
    ),

    //bottom Sheet Theme
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    ),
    //dialog Theme
    dialogTheme: DialogTheme(
      backgroundColor: const Color(0xff1F222A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(circularTrackColor: FxColors.primary),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'ios-1',
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
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'ios-3',
        overflow: TextOverflow.ellipsis,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
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
      titleLarge:

      TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontFamily: 'ios-2',
        fontWeight: FontWeight.bold,
        // overflow: TextOverflow.ellipsis,
      ),
    ),
    //bottomNavigationBarTheme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: FxColors.primary,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: FxColors.primary),
      unselectedIconTheme: IconThemeData(color: FxColors.primary),
      unselectedItemColor: FxColors.primarySecondary_Dark,
      selectedLabelStyle: TextStyle(
        backgroundColor: FxColors.primary_Dark,
        color: FxColors.primary,
      ),
      unselectedLabelStyle: TextStyle(
        backgroundColor: FxColors.primary,
        color: FxColors.primary,
      ),
      showSelectedLabels: null,
      showUnselectedLabels: null,
      type: BottomNavigationBarType.shifting,
    ));

