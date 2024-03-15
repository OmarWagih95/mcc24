import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chooseLanguages extends StatefulWidget {
  bool onBoard;
  chooseLanguages(this.onBoard);

  @override
  State<chooseLanguages> createState() => _chooseLanguagesState();
}

class _chooseLanguagesState extends State<chooseLanguages> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    print(widget.onBoard);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
          child: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'language',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            Text(
              ' choose language of the interface',
              style: TextStyle(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      minimumSize: MaterialStateProperty.all(Size(180, 40))),
                  onPressed: () {
                    BlocProvider.of<LanguagesCubit>(context).changeLanguages(false);
                  widget.onBoard?  Navigator.pushNamed(context, '${Routes.onboargingScreen}'):
                  Navigator.pop(context);
                  },
                  child: const Text(
                    'العربية',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LanguagesCubit>(context)
                          .changeLanguages(true);
                      widget.onBoard?  Navigator.pushNamed(context, '${Routes.onboargingScreen}'):
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(180, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      'ُEnglish',
                      style: TextStyle(color: Colors.blueGrey),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}

// bool isArabic() {
//   return Intl.getCurrentLocale() == "ar";
// }
