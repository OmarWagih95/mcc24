import 'package:MCC/cubits/home_page_cubit.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/detailPage.dart';
import 'package:MCC/views/loginScreen.dart';
import 'package:MCC/views/navpages/HomePage.dart';
import 'package:MCC/views/navpages/SettingsPage.dart';
import 'package:MCC/views/navpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();
  static String initR = '/home';
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorMyorder =
      GlobalKey<NavigatorState>(debugLabel: 'shellMyorder');
  static final _rootNavigatorsettings =
      GlobalKey<NavigatorState>(debugLabel: 'shellsettings');
  static final _rootNavigatorBakatSeyanaa =
      GlobalKey<NavigatorState>(debugLabel: 'shellseyanaa');

  static final GoRouter router = GoRouter(
      initialLocation: initR,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return mainpage(
              navigationShel: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(routes: [
              /* #1 */
              GoRoute(
                path: '/home',
                name: 'HomePage',
                builder: (context, state) {
                  return BlocProvider<HomePageCubit>(
                      create: (context) => HomePageCubit()..getCategoriesData(),
                      child: HomePage(
                        key: state.pageKey,
                      ));
                },
              )
            ], navigatorKey: _rootNavigatorHome),
            StatefulShellBranch(routes: [
              /* #2 */
              GoRoute(
                path: '/LoginScreen',
                name: 'LoginScreen',
                builder: (context, state) {
                  return LoginScreen(
                    key: state.pageKey,
                  );
                },
              )
            ], navigatorKey: _rootNavigatorMyorder),
            StatefulShellBranch(routes: [
              /* #3 */
              GoRoute(
                path: '/SettingsPage',
                name: 'SettingsPage',
                builder: (context, state) {
                  return SettingsPage(
                    key: state.pageKey,
                  );
                },
              )
            ], navigatorKey: _rootNavigatorsettings),
            StatefulShellBranch(routes: [
              /* #4 */
              GoRoute(
                path: '/detailPage',
                name: 'detailPage',
                builder: (context, state) {
                  return detailPage(
                    key: state.pageKey,
                  );
                },
              )
            ], navigatorKey: _rootNavigatorBakatSeyanaa),
          ],
        )
      ]);
}
