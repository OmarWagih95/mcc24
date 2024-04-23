import 'dart:async';
import 'dart:developer';

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/darkModeCubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/routing/routes.dart';
import 'package:MCC/views/selectLanguage.dart';
import 'package:MCC/widgets/SettingsListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialMedia { facebook, instgram, whatsapp, email, youtube }

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

GlobalKey<NavigatorState> SettingsPageNavigatorKey =
GlobalKey<NavigatorState>();

class _SettingsPageState extends State<SettingsPage> {
  Future<void>? _launched;
  Future<void> share(SocialMedia SocialMediaPlatform) async {
    // final subject = 'best app ever';
    // final text = 'watch this awesome video about our services';
    // final uRlshare = Uri.encodeComponent('www.youtube.com');
    final urls = {
      SocialMedia.facebook: 'https://www.facebook.com',
      SocialMedia.email: 'https://mail.google.com/mail',
      SocialMedia.instgram: 'https://www.instagram.com',
      SocialMedia.whatsapp: 'https://wa.me/0111111111',
      SocialMedia.youtube: 'https://www.youtube.com'
    };
    final url = Uri.parse('${urls[SocialMediaPlatform]}');
    log('url is $url');
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      log('url is $url جوه الللونش فانكشن ');
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      S.of(context).Settings,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(overflow: TextOverflow.visible),
                    ),
                  ),
                ),
                SettingsListItem(Icons.autorenew, S.of(context).Language_Exchange,
                        () {
                      BlocProvider.of<LanguagesCubit>(context).changeLanguages(
                          ((Localizations.localeOf(context).languageCode) == 'en')
                              ? 'ar'
                              : 'en');
                    }),
                SettingsListItem(
                    Icons.share, S.of(context).Share_Application, () {}),
                SettingsListItem(Icons.info, S.of(context).Who_Are, () {}),
                SettingsListItem(Icons.person, S.of(context).Sign_IN, () {
                  Navigator.of(context).pushNamed(Routes.LoginScreen);
                }),
                SettingsListItem(Icons.light_mode, S.of(context).Brightness_change,
                        () {
                      final mode = BlocProvider.of<Dark_lightModeCubit>(context).mode;
                      log(' from onPressed1 mode is $mode');
                      BlocProvider.of<Dark_lightModeCubit>(context)
                          .darkAndlightMode(mode == 'light' ? 'dark' : 'light');
                    }),
                SizedBox(height: 30.h,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center
                      ,children: [
                      Text(S.of(context).Text_Us,style: TextStyle(fontSize: 18.w),)
                    ],)
                    ,
                    // SettingsListItem(
                    //   null,
                    //   S.of(context).Text_Us,
                    //   () {},
                    //   links: true,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // decoration: BoxDecoration(
                      //     border:
                      //         Border(bottom: BorderSide(color: Colors.black54))),
                      child: Card(
                        elevation: .5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildsocialButton(
                              color: Colors.blueAccent.shade400,
                              onclick: () async {
                                setState(() async {
                                  _launched = share(SocialMedia.facebook);
                                });
                              },
                              icon: FontAwesomeIcons.facebook,
                            ),
                            buildsocialButton(
                              color: Colors.red,
                              onclick: () => share(SocialMedia.youtube),
                              icon: FontAwesomeIcons.youtube,
                            ),
                            buildsocialButton(
                              color: Colors.white,
                              onclick: () => share(SocialMedia.instgram),
                              icon: FontAwesomeIcons.instagram,
                            ),
                            buildsocialButton(
                              color: Colors.green,
                              onclick: () => share(SocialMedia.whatsapp),
                              icon: FontAwesomeIcons.whatsapp,
                            ),
                            buildsocialButton(
                              color: Colors.blueGrey,
                              onclick: () => share(SocialMedia.email),
                              icon: Icons.email,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

Widget buildsocialButton(
    {required IconData icon, Color? color, void Function()? onclick}) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gradient: (icon == FontAwesomeIcons.instagram)
              ? const LinearGradient(
              stops: null,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFFf9ce34),
                Color(0xFFee2a7b),
                Color(0xFF6228d7)
              ])
              : LinearGradient(
              stops: null,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Colors.white.withOpacity(.5),
                Colors.white,
              ])),
      width: 48,
      height: 48,
      child: Center(
        child: FaIcon(
          icon,
          color: color,
          size: 42,
        ),
      ),
    ),
    onTap: () {
      onclick!();
    },
  );
}
