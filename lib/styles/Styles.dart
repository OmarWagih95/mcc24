import 'package:androidstudiommc/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textstyles {
  static TextStyle font24bluewbold =  TextStyle(
      fontSize: 32, fontWeight: Fonthelper.bold, color: ColorsManager.mainColor);
  static TextStyle font14blueregular =  TextStyle(
      fontSize: 14,
      fontWeight: Fonthelper.regular,
      color: ColorsManager.mainColor);
  static TextStyle font24blackbold =
      const TextStyle(fontSize: 24, fontWeight: Fonthelper.bold);
  static TextStyle font14blackbold =
      const TextStyle(fontSize: 14, fontWeight: Fonthelper.bold);
  static TextStyle font14grayregular = const TextStyle(
      fontSize: 14, fontWeight: Fonthelper.bold, color: ColorsManager.gray);
  static TextStyle font14darkgraymedium = const TextStyle(
      fontSize: 14, fontWeight: Fonthelper.medium, color: ColorsManager.gray);
  static TextStyle font14darkbluemedium = const TextStyle(
      fontSize: 14,
      fontWeight: Fonthelper.medium,
      color: ColorsManager.darkBlue);
  static TextStyle font32blackbold =
      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle font12grayregular = const TextStyle(
      fontSize: 12,
      fontWeight: Fonthelper.bold,
      color: ColorsManager.lighterGray);
  static TextStyle font13grayregular = const TextStyle(
      fontSize: 13,
      fontWeight: Fonthelper.regular,
      color: ColorsManager.darkGray);
  static TextStyle font13blackregular = const TextStyle(
      fontSize: 13, fontWeight: Fonthelper.regular, color: Colors.black);
  static TextStyle font13bluewbold =  TextStyle(
      fontSize: 13,
      fontWeight: Fonthelper.regular,
      color: ColorsManager.mainColor);
}

class Fonthelper {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight black = FontWeight.w900;
}
