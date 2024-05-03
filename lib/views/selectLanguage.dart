import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class chooseLanguages extends StatelessWidget {
  bool onBoard;
  chooseLanguages(this.onBoard);

  @override
  Widget build(BuildContext context) {
    debugPrint('$onBoard');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SizedBox(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).language,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
                ),
                Text(
                  S.of(context).Choose_Language_Of_The_Interface,
                  style: TextStyle(fontSize: 18.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          minimumSize:
                              MaterialStateProperty.all(Size(150.w, 40.h))),
                      onPressed: () {
                        BlocProvider.of<LanguagesCubit>(context)
                            .changeLanguages('ar');
                        onBoard
                            ? Navigator.pushNamed(
                                context, Routes.onboargingScreen)
                            : Navigator.pop(context);
                      },
                      child: const Text(
                        "العربية",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LanguagesCubit>(context)
                              .changeLanguages('en');
                          onBoard
                              ? Navigator.pushNamed(
                                  context, Routes.onboargingScreen)
                              : Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(150.w, 40.h)),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor)),
                        child: Text(
                          S.of(context).English,
                          style: const TextStyle(color: Colors.black),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
