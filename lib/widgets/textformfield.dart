import 'package:androidstudiommc/constants/colors.dart';
import 'package:androidstudiommc/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffexicon;
  final Widget? prifixicon;
  final bool isSecured;
  final String hintText;
  const MyTextFormfield({
    super.key,
    this.isSecured = false,
    this.controller,
    required this.hintText,
    this.suffexicon, this.prifixicon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: ColorsManager.lighterGray,
          suffixIcon: suffexicon,
          prefix: prifixicon,
          // prefixIconColor: Colors.amberAccent,
          // prefixIconConstraints:BoxConstraints() ,
          // prefixStyle: Textstyles.font12grayregular,
          hintText: hintText,
          hintStyle: Textstyles.font14darkgraymedium,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: ColorsManager.lightGray, width: 1.3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  BorderSide(color: ColorsManager.mainBlue, width: 1.3))),
      style: Textstyles.font14darkbluemedium,
      obscureText: isSecured,
    );
  }
}
