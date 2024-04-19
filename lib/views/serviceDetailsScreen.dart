import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/MyButtonW.dart';
import 'package:MCC/widgets/Mybutton.dart';
import 'package:MCC/widgets/OurPropertiesListItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../model/service.dart';
import '../widgets/OrderingServiceDialog.dart';

class ServiceDetailsScreen extends StatelessWidget {
  Service service;
  ServiceDetailsScreen(this.service);

//   Service service;
// ServiceDetailsScreen(this.service);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorsManager.Color60Light,
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Container(
                  // color: ColorsManager.Color60Light,
                  height: 320.h,
                  width: double.infinity,
                  child:
                      Image.network(service.logoImgURL, fit: BoxFit.fitHeight),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 290.h,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.h),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: Container(
                        ////////////////////////  color /////////////////////////////
                        color: Theme.of(context).primaryColor.withOpacity(.3),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                service.AR['serviceName'],
                                style: TextStyle(
                                    fontSize: 25.w,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      service.AR['serviceDesc'],
                                      style: TextStyle(
                                          fontSize: 14.w,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ' :  ما نقدمه لكم ',
                                    style: TextStyle(
                                        fontSize: 20.w,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              OurProvidingListItem(Icons.engineering,
                                  S.of(context).expert_technicians),
                              OurProvidingListItem(Icons.shield_outlined,
                                  S.of(context).service_guarantee),
                              OurProvidingListItem(
                                  Icons.sentiment_very_satisfied,
                                  S.of(context).customer_satisfaction),
                              OurProvidingListItem(
                                  Icons.money_off, S.of(context).best_prices),
                              OurProvidingListItem(Icons.verified,
                                  S.of(context).money_back_guarantee),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  ////////////////////////  color /////////////////////////////
                  color: Theme.of(context).primaryColor.withOpacity(.3),
                  child: MyButton(
                      text: S.of(context).service_request,
                      onClick: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                OrderingServiceDialog(service));
                        print('clicked');
                      },
                      textColor: Colors.white,
                      buttonColor: ColorsManager.Color10Light),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
