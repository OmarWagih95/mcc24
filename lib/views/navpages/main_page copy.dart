// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:MCC/cash/shared_pref.dart';
// import 'package:MCC/cubits/auth_cubit.dart';
// import 'package:MCC/cubits/login_cubit.dart';
// import 'package:MCC/generated/l10n.dart';
// import 'package:MCC/helpers/constants.dart';
// import 'package:MCC/services/Network_data_services.dart';
// import 'package:MCC/views/loginScreen.dart';
// import 'package:MCC/views/navpages/SettingsPage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../constants/colors.dart';
// import '../../cubits/home_page_cubit.dart';
// import 'bakaatSeyanaa.dart';
// import '/views/navpages/HomePage.dart';
// import '/views/navpages/Mypage.dart';

// class mainpage extends StatefulWidget {
//   final bool? is_login;
//   final int? navigationIndexfromRouting;
//   mainpage({super.key, this.is_login, this.navigationIndexfromRouting});

//   @override
//   State<mainpage> createState() => _mainpageState();
// }

// class _mainpageState extends State<mainpage> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     getUserDate() async {
//       BlocProvider.of<AuthCubit>(context).user =
//           await BlocProvider.of<AuthCubit>(context).getUserData();
//     }

//     getUserDate();
//   }

//   Future<bool> _systemBackButtonPressed() async {
//     if (_navigatorKeys[Currindx].currentState?.canPop() == true) {
//       _navigatorKeys[Currindx]
//           .currentState
//           ?.pop(_navigatorKeys[Currindx].currentContext);
//       return false;
//     } else {
//       SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
//       return true; // Indicate that the back action is handled
//     }
//   }

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     HomePageNavigatorKey,
//     LoginScreenNavigatorKey,
//     MypageNavigatorKey,
//     SettingsPageNavigatorKey,
//     bakaatSeyanaaNavigatorKey,
//   ];
//   int Currindx = 0;

//   List pages = [
//     BlocProvider<HomePageCubit>(
//       create: (context) => HomePageCubit(),
//       child: HomePage(),
//     ),
//     LoginScreen(),
//     SettingsPage(),
//     bakaatSeyanaa()
//   ];
//   List pages2 = [
//     BlocProvider<HomePageCubit>(
//       create: (context) => HomePageCubit(),
//       child: HomePage(),
//     ),
//     Mypage(),
//     SettingsPage(),
//     bakaatSeyanaa()
//   ];

//   void Function(int)? ontap(indx) {
//     setState(() {
//       Currindx = indx;
//     });
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Islogin = CashHelper.getBool(key: 'Islogin') ?? false;
//     return WillPopScope(
//       onWillPop: _systemBackButtonPressed,
//       child: Scaffold(
//           bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.shifting,
//               selectedItemColor: ColorsManager.mainColor,
//               unselectedItemColor: ColorsManager.mainColor.withOpacity(.3),
//               currentIndex: Currindx,
//               onTap: (e) => ontap(e),
//               items: [
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.apps), label: S.of(context).Home),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.person), label: S.of(context).My_Order),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.settings), label: S.of(context).Settings),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.auto_fix_normal),
//                     label: S.of(context).Maintainance_Packages),
//               ]),
//           body: (Islogin == false) ? pages[Currindx] : pages2[Currindx]),
//     );
//   }
// }
