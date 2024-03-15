import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/selectLanguage.dart';
import 'package:MCC/widgets/SettingsListItem.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: Scaffold(
        appBar: AppBar(leading: Row(
          children: [
            Icon(Icons.notifications,size: 25,color: Colors.black54,),
          ],
        ),actions: [Text('إعدادات',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black54),)],
        ),
        body: SingleChildScrollView(child: Column(
          children: [
              SettingsListItem(Icons.autorenew, 'تغيير اللغة',(){  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => chooseLanguages(false),
                  ));

              }),
            SettingsListItem(Icons.email, 'راسلناا',(){}),
            SettingsListItem(Icons.share, 'مشاركة التطبيق',(){}),
            SettingsListItem(Icons.info, 'من نحن',(){}),
            SettingsListItem(Icons.person, 'تسجيل مستخدم',(){}),
          ],
        )),
      ),
    );
  }
}
