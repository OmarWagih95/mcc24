import 'dart:developer';

import 'package:MCC/bloc/blocobserver.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/LanguagesCupitStates.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/app_router.dart';
import 'package:MCC/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubits/user_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(BlocProvider(
    create: (context) => UserCubit(),
    child: BlocProvider(
      create: (context) =>
      LanguagesCubit()
        ..changeLanguages('en'),
      child: BlocProvider(
        create: (context) => ServicesCubit(),
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocProvider(
            create: (context) => AuthCubit(),
            child: MyApp(
              approuter: Approuter(),
            ),
          ),
        ),
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
          if (state is LanguagesSuccessState) {
            log(state.language);
            return ScreenUtilInit(
              designSize: Size(380, 812), // used for
              minTextAdapt: true, // used for
              child: MaterialApp(
                locale: Locale('${state.language}'),
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
          } else {
            return Container();
          }
        });
  }
}
