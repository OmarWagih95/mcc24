import 'package:MCC/constants/colors.dart';
import 'package:MCC/styles/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? suffexicon;
  final Widget? prifixicon;
  final bool isSecured;
  final String hintText;
  String? Function(String?)? validation;
  MyTextFormfield({
    this.validation,
    super.key,
    this.isSecured = false,
    this.controller,
    required this.hintText,
    this.suffexicon,
    this.prifixicon, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.lighterGray,
        suffixIcon: suffexicon,
        prefix: prifixicon,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.black54),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.h),
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
      ),
      style: Textstyles.font14darkbluemedium,
      obscureText: isSecured,
    );
  }
}
