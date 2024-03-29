import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/widgets/Dots.dart';
import '/widgets/mytext.dart';

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
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpg',
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
        padding: EdgeInsets.only(top: 15),
        child: PageView.builder(
            controller: pageController,
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, counter) {
              indx = counter;
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(img + Images[indx]))),
                  child: Container(
                    // width: 200,
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
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              S.of(context).skip,
                                              style: TextStyle(fontSize: 16),
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        indx == 3
                            ? Container(
                                width: 405,
                                height: 40,
                                // padding: EdgeInsets.all(5),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                ColorsManager.mainColor)),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '${Routes.mainPage}');
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        mytext(
          S.of(context).Continue,
          color: Colors.white,
          size: 20,
        ),
        Icon(
          color: Colors.white,
         Localizations.localeOf(context).languageCode == "en"
              ? Icons.arrow_right_rounded
              : Icons.arrow_left_rounded,
          size: 35,
        ),
      ]),
    );
  }
}
