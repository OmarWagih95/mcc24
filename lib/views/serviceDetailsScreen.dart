import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/widgets/MyButtonW.dart';
import 'package:MCC/widgets/Mybutton.dart';
import 'package:MCC/widgets/OurPropertiesListItem.dart';
import 'package:MCC/widgets/customAppbar.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                Container(
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
                  height: 280.h,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: Container(
                        decoration: BoxDecoration(
                            ////////////////////////  color /////////////////////////////
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                (Localizations.localeOf(context).languageCode ==
                                        'ar')
                                    ? service.AR['serviceName']
                                    : service.EN['serviceName'],
                                style: TextStyle(
                                    fontSize: 25.w,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Wrap(children: [
                                      Text(
                                          (Localizations.localeOf(context)
                                                      .languageCode ==
                                                  'ar')
                                              ? service.AR['serviceDesc']
                                              : service.EN['serviceDesc'],
                                          style: TextStyle(
                                              fontSize: 14.w,
                                              fontWeight: FontWeight.w600),
                                          // softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3),
                                    ])
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    S.of(context).What_We_Offer_You,
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
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: MyButton(
                      text: S.of(context).service_request,
                      onClick: () {
                        if (BlocProvider.of<AuthCubit>(context).user != null) {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  OrderingServiceDialog(service));
                          print('clicked');
                        } else {
                          ScaffoldMessenger.of(context)
                              // هغير اللغة هنا
                              .showSnackBar(SnackBar(
                                  duration: Duration(seconds: 5),
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  content: Column(
                                    children: [
                                      Text(
                                        S.of(context).Click_here_to_log_in,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  Routes.LoginScreen);
                                        },
                                        child: Text(
                                          S
                                              .of(context)
                                              .log_in_first_to_request_the_service,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                      ),
                                    ],
                                  )));
                        }
                      },
                      // textColor: Theme.of(context).focusColor,
                      // textColor: Colors.black,
                      // buttonColor: FxColors.primary),
                    textColor: Theme.of(context).hintColor,
                      buttonColor: Theme.of(context).primaryColor),
                      // buttonColor: Theme.of(context).primaryColor),
                )
              ],
            ),
            customAppbar(title: S.of(context).service_request),
          ]),
        ),
      ),
    );
  }
}
