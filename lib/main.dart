import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/LanguagesCupitStates.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/app_router.dart';
import 'package:MCC/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BlocProvider(
    create: (context) => LanguagesCubit(),
    child: BlocProvider(
      create: (context) => ServicesCubit(),
      child: MyApp(
        approuter: Approuter(),
      ),
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
          return ScreenUtilInit(
            designSize: Size(380, 812), // used for
            minTextAdapt: true, // used for
            child: MaterialApp(
              locale: Locale(BlocProvider
                  .of<LanguagesCubit>(context)
                  .lan),
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
            ),
          );
        });
  }
}
