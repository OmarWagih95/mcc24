// import 'package:MCC/generated/l10n.dart';
// import 'package:flutter/material.dart';

// class MyOrderBeforelogin extends StatelessWidget {
//   const MyOrderBeforelogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text());
//   }
// }
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/customAppbar.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey<NavigatorState> MyOrderBeforeloginKey = GlobalKey<NavigatorState>();

class MyOrderBeforelogin extends StatelessWidget {
  const MyOrderBeforelogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(children: [
        SafeArea(
            child: customAppbar(
          arrow: false,
          title: S.of(context).Sign_IN,
        )),
        Spacer(),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'LoginScreen');
              },
              child: Container(
                  height: 100.h,
                  child: Card(
                    borderOnForeground: false,
                    shadowColor: Colors.transparent,
                    color: Theme.of(context).primaryColorLight,
                    surfaceTintColor: Colors.transparent,
                    elevation: 5,
                    child: Center(
                      child: Text(
                        S.of(context).Click_here_to_log_in_toshowyourOrders,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  )),
            )
          ],
        ),
        Spacer(),
      ]),
    );
  }
}
