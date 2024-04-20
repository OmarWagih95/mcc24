import 'package:MCC/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LeftAppBarUpdate extends StatefulWidget {
  const LeftAppBarUpdate({super.key});

  @override
  State<LeftAppBarUpdate> createState() => _LeftAppBarUpdateState();
}

class _LeftAppBarUpdateState extends State<LeftAppBarUpdate> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            //  color: Colors.white,
          )),
      IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              S.of(context).No_notifications_now,
              style: TextStyle(fontSize: 32),
            )));
          },
          icon: Icon(
            Icons.notifications,
            //  color:  Colors.white,
          )),
    ]);
  }
}
