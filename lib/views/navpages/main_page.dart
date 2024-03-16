// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:androidstudiommc/cubits/home_page_cubit.dart';
import 'package:androidstudiommc/views/loginScreen.dart';
import 'package:androidstudiommc/views/navpages/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
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
  int Currindx = 0;
  List pages = [HomePage(), LoginScreen(), SettingsPage(), BlocProvider(
  create: (context) => HomePageCubit(),
  child: Mypage())];

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
                  icon: Icon(Icons.apps), label: 'الرئيسية'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'طلبي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'الأعدادات'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_fix_normal), label: 'باقات الصيانة'),
            ]),
        body: pages[Currindx]);
  }
}
