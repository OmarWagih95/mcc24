import 'package:androidstudiommc/cubits/LanguagesCupit.dart';
import 'package:androidstudiommc/cubits/LanguagesCupitStates.dart';
import 'package:androidstudiommc/generated/l10n.dart';
import 'package:androidstudiommc/routing/app_router.dart';
import 'package:androidstudiommc/routing/routes.dart';
import 'package:androidstudiommc/views/selectLanguage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(BlocProvider(
    create: (context) => LanguagesCubit(),
    child: MyApp(
      approuter: Approuter(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Approuter approuter;

  MyApp({Key? key, required this.approuter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguagesCubit, LanguagesState>(
        builder: (context, state) {
      return MaterialApp(
        locale: Locale(BlocProvider.of<LanguagesCubit>(context).lan),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.white)),
        initialRoute: Routes.selectLanguagePage,
        onGenerateRoute: approuter.generateRoute,
      );
    });
  }
}
