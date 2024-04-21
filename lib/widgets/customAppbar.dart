import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';

class customAppbar extends StatelessWidget {
  final String title;
  customAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Theme.of(context).iconTheme.color!,
          blurRadius: 3,
          blurStyle: BlurStyle.outer,
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  // color: ColorsManager.Color10Light,
                )),
            Spacer(),
            Text(
              title,
              style: TextStyle(fontSize: 24),
            ),
            Spacer(),
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
                  color: Theme.of(context).iconTheme.color,
                  // color: ColorsManager.Color10Light
                )),
          ],
        ),
      ),
    );
  }
}
