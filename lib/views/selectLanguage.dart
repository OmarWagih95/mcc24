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
    print(onBoard);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).language,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          minimumSize:
                              MaterialStateProperty.all(Size(180.w, 40.h))),
                      onPressed: () {
                        BlocProvider.of<LanguagesCubit>(context)
                            .changeLanguages(false);
                        onBoard
                            ? Navigator.pushNamed(
                                context, Routes.onboargingScreen)
                            : Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).Arabic,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LanguagesCubit>(context)
                              .changeLanguages(true);
                          onBoard
                              ? Navigator.pushNamed(
                                  context, Routes.onboargingScreen)
                              : Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(180.w, 40.h)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          S.of(context).English,
                          style: const TextStyle(color: Colors.blueGrey),
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

// bool isArabic() {
//   return Intl.getCurrentLocale() == "ar";
// }
