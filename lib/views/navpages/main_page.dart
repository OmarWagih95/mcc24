// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:MCC/generated/l10n.dart';
import 'package:MCC/services/Network_data_services.dart';
import 'package:MCC/views/loginScreen.dart';
import 'package:MCC/views/navpages/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../cubits/home_page_cubit.dart';
import '/views/navpages/BarItemPage.dart';
import '/views/navpages/HomePage.dart';
import '/views/navpages/Mypage.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  ////////
  var Externaldata_ = Externaldata();

  int Currindx = 0;
  List pages = [
    BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit()..getCategoriesData(),
      child: HomePage(),
    ),
    LoginScreen(),
    SettingsPage(),
    Mypage()
  ];

  void Function(int)? ontap(indx) {
    setState(() {
      Currindx = indx;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: ColorsManager.mainColor,
            unselectedItemColor: ColorsManager.mainColor.withOpacity(.3),
            currentIndex: Currindx,
            onTap: (e) => ontap(e),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: S.of(context).Home),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: S.of(context).My_Order),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: S.of(context).Settings),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_fix_normal),
                  label: S.of(context).Maintainance_Packages),
            ]),
        body: pages[Currindx]);
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:MCC/cubits/SearchCupit.dart';
// import 'package:MCC/generated/l10n.dart';
// import 'package:MCC/views/loginScreen.dart';
// import 'package:MCC/views/navpages/SettingsPage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../constants/colors.dart';
// import '../../cubits/home_page_cubit.dart';
// import '/views/navpages/BarItemPage.dart';
// import '/views/navpages/HomePage.dart';
// import '/views/navpages/Mypage.dart';

// class mainpage extends StatefulWidget {
//   const mainpage({super.key});

//   @override
//   State<mainpage> createState() => _mainpageState();
// }

// class _mainpageState extends State<mainpage> {
//   ////////
//   int Currindx = 0;
//   List<Category> SearchCubitDUMMY_CATEGORIES = [];

//   List pages = [
//     Mypage(),
//     LoginScreen(),
//     SettingsPage(),
//     MultiBlocProvider(providers: [
//       BlocProvider<HomePageCubit>(
//         create: (BuildContext context) => HomePageCubit(),
//       ),
//       BlocProvider<SearchCubit>(create: (BuildContext context) {
//         return SearchCubit(SearchCubitDUMMY_CATEGORIES);
//       }),
//     ], child: HomePage())
//   ];

//   void Function(int)? ontap(indx) {
//     setState(() {
//       Currindx = indx;
//     });
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     SearchCubitDUMMY_CATEGORIES =
//         context.read<HomePageCubit>().categoryDataList;

//     return Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.shifting,
//             selectedItemColor: ColorsManager.mainColor,
//             unselectedItemColor: ColorsManager.mainColor.withOpacity(.3),
//             currentIndex: Currindx,
//             onTap: (e) => ontap(e),
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.apps), label: S.of(context).Home),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person), label: S.of(context).My_Order),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.settings), label: S.of(context).Settings),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.auto_fix_normal),
//                   label: S.of(context).Maintainance_Packages),
//             ]),
//         body: pages[Currindx]);
//   }
// }
