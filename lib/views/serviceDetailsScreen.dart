import 'package:MCC/cubits/auth_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/widgets/MyButtonW.dart';
import 'package:MCC/widgets/OurPropertiesListItem.dart';
import 'package:MCC/widgets/customAppbar.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import '../model/service.dart';
import '../widgets/OrderingServiceDialog.dart';

class ServiceDetailsScreen extends StatefulWidget {
  Service service;

  ServiceDetailsScreen(this.service);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(
          "https://firebasestorage.googleapis.com/v0/b/mmctest-18030.appspot.com/o/videos%2Fvideo2.mp4?alt=media&token=857e4ce0-0ec3-4644-b6d1-28b51b3f52ea"),
    ));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

//   Service service;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //App bar
              SafeArea(
                child: customAppbar(
                  arrow: true,
                  title: (Localizations.localeOf(context).languageCode == 'ar')
                      ? widget.service.AR['serviceName']
                      : widget.service.EN['serviceName'],
                ),
              ),

              ///body
              Stack(children: [
                Positioned(
                  // top: 100,
                  child: Container(
                    width: double.infinity,
                    /////////////////slider////////////
                    child: CarouselSlider(
                      items: [
                        Container(
                          width: double.infinity,
                          child: Image.network(widget.service.logoImgURL,
                              fit: BoxFit.cover),
                        ),
                        Container(
                          child: FlickVideoPlayer(flickManager: flickManager),
                        ),
                      ],
                      options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 100.h,
                //   child: Container(
                //     height: MediaQuery.of(context).size.height - 340.h,
                //     width: double.infinity,
                //     decoration: BoxDecoration(color: Colors.black),
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 220.h,
                    ),
                    Stack(
                      children: [
                        // ClipRRect(
                        //   borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(25.r),
                        //     topRight: Radius.circular(25.r),
                        //   ),
                        //   child:
                        Container(
                          decoration: BoxDecoration(
                            ////////////////////////  color /////////////////////////////
                            color: Theme.of(context).scaffoldBackgroundColor,
                            // borderRadius: BorderRadius.only(
                            //   topLeft: Radius.circular(25.r),
                            //   topRight: Radius.circular(25.r),
                            // ),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  (Localizations.localeOf(context)
                                              .languageCode ==
                                          'ar')
                                      ? widget.service.AR['serviceName']
                                      : widget.service.EN['serviceName'],
                                  style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            (Localizations.localeOf(context)
                                                        .languageCode ==
                                                    'ar')
                                                ? widget
                                                    .service.AR['serviceDesc']
                                                : widget
                                                    .service.EN['serviceDesc'],
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      S.of(context).What_We_Offer_You,
                                      style: TextStyle(
                                          fontSize: 20.sp,
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
                                // OurProvidingListItem(Icons.verified,
                                //     S.of(context).money_back_guarantee),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 400,
                        ),
                        // ),
                      ],
                    ),
                    Container(
                      ////////////////////////  color /////////////////////////////
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: MyButton(
                          text: S.of(context).service_request,
                          onClick: () {
                            if (BlocProvider.of<AuthCubit>(context).user !=
                                null) {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      OrderingServiceDialog(widget.service));
                              debugPrint('clicked');
                            } else {
                              ScaffoldMessenger.of(context)
                                  // هغير اللغة هنا
                                  .showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 5),
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
                                  ),
                                ),
                              );
                            }
                          },
                          textColor: Theme.of(context).hintColor,
                          buttonColor: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                // customAppbar(title: S.of(context).service_request),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
