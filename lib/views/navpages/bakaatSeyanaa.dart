import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/customAppbar.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> bakaatSeyanaaNavigatorKey =
    GlobalKey<NavigatorState>();

class bakaatSeyanaa extends StatelessWidget {
  const bakaatSeyanaa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(children: [
        SafeArea(
            child: customAppbar(
          arrow: false,
          title: S.of(context).Maintainance_Packages,
        )),
        Spacer(),
        Column(
          children: [
            Container(
                height: 200.h,
                child: Card(
                    borderOnForeground: false,
                    shadowColor: Colors.transparent,
                    color: Theme.of(context).primaryColorLight,
                    surfaceTintColor: Colors.transparent,
                    elevation: 5,
                    child: Center(
                      child: Text(
                        S.of(context).No_offers_now,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ))),
          ],
        ),
        Spacer(),
      ]),
    );
  }
}
