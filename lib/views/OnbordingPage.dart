import 'package:MCC/cash/shared_pref.dart';
import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/helpers/constants.dart';
import 'package:MCC/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/Dots.dart';
import '/widgets/mytext.dart';

void setOnboardingFinished() async {
  IsOnboardingFinished = true;
  await CashHelper.setData(
    key: 'IsOnboardingFinished',
    value: IsOnboardingFinished,
  );
}

class onboardingPage extends StatefulWidget {
  onboardingPage({super.key});

  @override
  State<onboardingPage> createState() => _welcomState();
}

class _welcomState extends State<onboardingPage> {
  String img = 'img/mmcassits/';
  int indx = 0;

  PageController pageController = PageController();
  List Images = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
  ];

  @override
  Widget build(BuildContext context) {
    List Texts = [
      S.of(context).Choose_your_service_easily,
      S.of(context).Describe_your_request,
      S.of(context).Select_the_best_offer_for_you,
      S.of(context).Complete_the_service_and_rate_the_service_provider,
    ];
    var Skip = S.of(context).skip;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 5.h),
        child: PageView.builder(
            controller: pageController,
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, counter) {
              indx = counter;
              return SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  width: double.infinity,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          scale: 1.5,
                          fit: BoxFit.contain,
                          image: AssetImage(img + Images[indx]))),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: indx < 3
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                indx < 3 ? Dots(Pageindex: indx) : SizedBox(),
                                indx < 3
                                    ? GestureDetector(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w, vertical: 8.h),
                                            child: Text(
                                              S.of(context).skip,
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            indx = 3;
                                            pageController.jumpToPage(indx);
                                          });
                                        },
                                      )
                                    : SizedBox()
                              ],
                            ),
                            Text(
                              Texts[indx],
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        indx == 3
                            ? Container(
                                width: 405.w,
                                height: 40.h,
                                // padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Theme.of(context)
                                                    .primaryColor)),
                                    onPressed: () {
                                      setOnboardingFinished();
                                      Navigator.pushNamed(
                                          context, Routes.mainPage);
                                    },
                                    child: onbordingInputButton()),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class onbordingInputButton extends StatelessWidget {
  const onbordingInputButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        SizedBox(
          width: 10.w,
        ),
        mytext(
          S.of(context).Continue,
          size: 20.sp,
        ),
        Spacer(),
        Icon(
          color: Colors.black,
          Localizations.localeOf(context).languageCode == "en"
              ? Icons.arrow_right_rounded
              : Icons.arrow_left_rounded,
          size: 35.r,
        ),
      ]),
    );
  }
}
