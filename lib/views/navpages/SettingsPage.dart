import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/selectLanguage.dart';
import 'package:MCC/widgets/SettingsListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              Icon(
                Icons.notifications,
                size: 25,
                color: Colors.black54,
              ),
            ],
          ),
          actions: [
            Text(
              S.of(context).Settings,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SettingsListItem(
                Icons.autorenew, S.of(context).Language_Exchange, () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => chooseLanguages(false),
              ));
            }),
            SettingsListItem(Icons.email, S.of(context).Text_Us, () {}),
            SettingsListItem(
                Icons.share, S.of(context).Share_Application, () {}),
            SettingsListItem(Icons.info, S.of(context).Who_Are, () {}),
            SettingsListItem(Icons.person, S.of(context).Sign_IN, () {}),
          ],
        )),
      ),
    );
  }
}
