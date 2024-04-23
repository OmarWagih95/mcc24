// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:MCC/cash/shared_pref.dart';
import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/constants.dart';
import 'package:MCC/services/Network_data_services.dart';
import 'package:MCC/views/loginScreen.dart';
import 'package:MCC/views/navpages/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../cubits/home_page_cubit.dart';
import 'bakaatSeyanaa.dart';
import '/views/navpages/HomePage.dart';
import '/views/navpages/Mypage.dart';

int Currindx = 0;
int get getCurrindx => Currindx;
void Function() changeremoteindex = () {};

class mainpage extends StatefulWidget {
  final bool? is_login;
  final int? navigationIndexfromRouting;
  mainpage({super.key, this.is_login, this.navigationIndexfromRouting});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  void initState() {
    // TODO: implement initState

    getUserDate() async {
      BlocProvider.of<AuthCubit>(context).user =
          await BlocProvider.of<AuthCubit>(context).getUserData();
    }

    getUserDate();
  }

  Future<bool> _systemBackButtonPressed() async {
    if (_navigatorKeys[Currindx].currentState?.canPop() == true) {
      _navigatorKeys[Currindx]
          .currentState
          ?.pop(_navigatorKeys[Currindx].currentContext);
      return false;
    } else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      return true; // Indicate that the back action is handled
    }
  }

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    HomePageNavigatorKey,
    LoginScreenNavigatorKey,
    MypageNavigatorKey,
    SettingsPageNavigatorKey,
    bakaatSeyanaaNavigatorKey,
  ];
  List<Widget> pages = [
    // BlocProvider<HomePageCubit>(
    //   create: (context) => HomePageCubit(),
    //   child: HomePage(),
    // )
    HomePage(),
    LoginScreen(),
    SettingsPage(),
    bakaatSeyanaa()
  ];

  List<Widget> pages2 = [
    // BlocProvider<HomePageCubit>(
    //   create: (context) => HomePageCubit(),
    //   child: HomePage(),
    // ),
    HomePage(),
    Mypage(),
    SettingsPage(),
    bakaatSeyanaa()
  ];
  void changeremoteindexhelper() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    changeremoteindex = changeremoteindexhelper;
    Islogin = CashHelper.getBool(key: 'Islogin') ?? false;
    return WillPopScope (
      onWillPop: _systemBackButtonPressed,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          indicatorShape: StadiumBorder(),
          animationDuration: Duration(milliseconds: 1000),
          onDestinationSelected: (int index) {
            setState(() {
              Currindx = index;
            });
          },
          selectedIndex: Currindx,
          destinations: [
            NavigationDestination(
              selectedIcon: Card(
                elevation: 4,
                child: Icon(
                  size: 40,
                  Icons.apps,
                ),
              ),
              icon: Icon(
                Icons.apps,
              ),
              label: S.of(context).Home,
            ),
            NavigationDestination(
              selectedIcon: Card(
                elevation: 4,
                child: Icon(
                  size: 40,
                  Icons.person,
                ),
              ),
              icon: Icon(
                Icons.person,
              ),
              label: S.of(context).My_Order,
            ),
            NavigationDestination(
              selectedIcon: Card(
                elevation: 4,
                child: Icon(
                  size: 40,
                  Icons.settings,
                ),
              ),
              icon: Icon(
                Icons.settings,
              ),
              label: S.of(context).Settings,
            ),
            NavigationDestination(
              selectedIcon: Card(
                elevation: 4,
                child: Icon(
                  size: 40,
                  Icons.auto_fix_normal,
                ),
              ),
              icon: Icon(
                Icons.auto_fix_normal,
              ),
              label: S.of(context).Maintainance_Packages,
            ),
          ],
        ),
        body: SafeArea(
          top: false,
          child: IndexedStack(
              index: Currindx, children: (Islogin == false) ? pages : pages2),
        ),
      ),
    );
  }
}
