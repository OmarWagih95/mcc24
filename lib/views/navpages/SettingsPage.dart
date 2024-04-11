import 'dart:async';
import 'dart:developer';

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/LanguagesCupit.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Scaffold(
        appBar: AppBar(
          leading: const Row(
            children: [
              Icon(
                Icons.notifications,
                size: 25,
                color: Colors.black54,
              ),
            ],
          ),
          actions: [
            Text(
              S.of(context).Settings,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black54),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SettingsListItem(Icons.autorenew, S.of(context).Language_Exchange,
                () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => chooseLanguages(false),
              ));
            }),
            SettingsListItem(
                Icons.share, S.of(context).Share_Application, () {}),
            SettingsListItem(Icons.info, S.of(context).Who_Are, () {}),
            SettingsListItem(Icons.person, S.of(context).Sign_IN, () {}),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingsListItem(
                  null,
                  S.of(context).Text_Us,
                  () {},
                  links: true,
                ),
                Container(
                  // decoration: BoxDecoration(
                  //     border:
                  //         Border(bottom: BorderSide(color: Colors.black54))),
                  child: Card(
                    // color: ColorsManager.mainColor.withOpacity(0.2),
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
        )),
      ),
    );
  }
}
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'URL Launcher',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'URL Launcher'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool _hasCallSupport = false;
//   Future<void>? _launched;
//   String _phone = '';

//   @override
//   void initState() {
//     super.initState();
//     // Check for phone call support.
//     canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
//       setState(() {
//         _hasCallSupport = result;
//       });
//     });
//   }

//   Future<void> _launchInBrowser(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInBrowserView(Uri url) async {
//     if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebView(Uri url) async {
//     if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchAsInAppWebViewWithCustomHeaders(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(
//           headers: <String, String>{'my_header_key': 'my_header_value'}),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchInWebViewWithoutDomStorage(Uri url) async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppWebView,
//       webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   Future<void> _launchUniversalLinkIOS(Uri url) async {
//     final bool nativeAppLaunchSucceeded = await launchUrl(
//       url,
//       mode: LaunchMode.externalNonBrowserApplication,
//     );
//     if (!nativeAppLaunchSucceeded) {
//       await launchUrl(
//         url,
//         mode: LaunchMode.inAppBrowserView,
//       );
//     }
//   }

//   Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return const Text('');
//     }
//   }

//   Future<void> _makePhoneCall(String phoneNumber) async {
//     final Uri launchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber,
//     );
//     await launchUrl(launchUri);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // onPressed calls using this URL are not gated on a 'canLaunch' check
//     // because the assumption is that every device can launch a web URL.
//     final Uri toLaunch =
//         Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TextField(
//                     onChanged: (String text) => _phone = text,
//                     decoration: const InputDecoration(
//                         hintText: 'Input the phone number to launch')),
//               ),
//               ElevatedButton(
//                 onPressed: _hasCallSupport
//                     ? () => setState(() {
//                           _launched = _makePhoneCall(_phone);
//                         })
//                     : null,
//                 child: _hasCallSupport
//                     ? const Text('Make phone call')
//                     : const Text('Calling not supported'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(toLaunch.toString()),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInBrowser(toLaunch);
//                 }),
//                 child: const Text('Launch in browser'),
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInBrowserView(toLaunch);
//                 }),
//                 child: const Text('Launch in app'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchAsInAppWebViewWithCustomHeaders(toLaunch);
//                 }),
//                 child: const Text('Launch in app (Custom Headers)'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInWebViewWithoutJavaScript(toLaunch);
//                 }),
//                 child: const Text('Launch in app (JavaScript OFF)'),
//               ),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInWebViewWithoutDomStorage(toLaunch);
//                 }),
//                 child: const Text('Launch in app (DOM storage OFF)'),
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchUniversalLinkIOS(toLaunch);
//                 }),
//                 child: const Text(
//                     'Launch a universal link in a native app, fallback to Safari.(Youtube)'),
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               ElevatedButton(
//                 onPressed: () => setState(() {
//                   _launched = _launchInWebView(toLaunch);
//                   Timer(const Duration(seconds: 5), () {
//                     closeInAppWebView();
//                   });
//                 }),
//                 child: const Text('Launch in app + close after 5 seconds'),
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               Link(
//                 uri: Uri.parse(
//                     'https://pub.dev/documentation/url_launcher/latest/link/link-library.html'),
//                 target: LinkTarget.blank,
//                 builder: (BuildContext ctx, FollowLink? openLink) {
//                   return TextButton.icon(
//                     onPressed: openLink,
//                     label: const Text('Link Widget documentation'),
//                     icon: const Icon(Icons.read_more),
//                   );
//                 },
//               ),
//               const Padding(padding: EdgeInsets.all(16.0)),
//               FutureBuilder<void>(future: _launched, builder: _launchStatus),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class buildsocialButton extends StatefulWidget {
//   final IconData icon;
//   final Color? color;
//   final Future<void> onclick;
//   const buildsocialButton(
//       {required this.icon, this.color, required this.onclick});

//   @override
//   State<buildsocialButton> createState() => _buildsocialButtonState();
// }

// class _buildsocialButtonState extends State<buildsocialButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(8)),
//             gradient: (widget.icon == FontAwesomeIcons.instagram)
//                 ? const LinearGradient(
//                     stops: null,
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                     colors: [
//                         Color(0xFFf9ce34),
//                         Color(0xFFee2a7b),
//                         Color(0xFF6228d7)
//                       ])
//                 : LinearGradient(
//                     stops: null,
//                     begin: Alignment.bottomLeft,
//                     end: Alignment.topRight,
//                     colors: [
//                         Colors.white.withOpacity(.5),
//                         Colors.white,
//                       ])),
//         width: 48,
//         height: 48,
//         child: Center(
//           child: FaIcon(
//             widget.icon,
//             color: widget.color,
//             size: 42,
//           ),
//         ),
//       ),
//       onTap: () async {
//         await widget.onclick;
//       },
//     );
//     ;
//   }
// }