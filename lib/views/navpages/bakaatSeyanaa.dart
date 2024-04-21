import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> bakaatSeyanaaNavigatorKey =
    GlobalKey<NavigatorState>();

class bakaatSeyanaa extends StatelessWidget {
  const bakaatSeyanaa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: [
          SafeArea(
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Text(S.of(context).Maintainance_Packages,
                        style: Theme.of(context).textTheme.displayMedium),
                  )
                ],
              ),
              leftappbar()
            ]),
          ),
          Spacer(),
          Column(
            children: [
              Container(
                  height: 200.h,
                  child: Card(
                      elevation: 5,
                      child: Center(
                        child: Text(
                          No_offers_now,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ))),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
