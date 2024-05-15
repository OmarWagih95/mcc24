// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/userModel.dart';
import 'package:MCC/widgets/leftappbarUpdate.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/home_page_cubit.dart';
import '../categories_screan.dart';
import '/cubits/visibilityCubit.dart';
import '/widgets/homePageHelperWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

GlobalKey<NavigatorState> HomePageNavigatorKey = GlobalKey<NavigatorState>();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    late userModel? user = BlocProvider.of<AuthCubit>(context).user;
    // TODO: implement initState
    // debugPrint(BlocProvider.of<AuthCubit>(context).user!.userID!);
    getUserDate() async {
      debugPrint('hna1');
      try {
        user = await BlocProvider.of<AuthCubit>(context).getUserData();
        debugPrint('${user!.userID!} test main user');
      } catch (e) {
        debugPrint('$e');
      }
    }

    try {
      getUserDate();
      debugPrint('userData tmaaam');
    } catch (e) {
      debugPrint('$e');
    }
    BlocProvider.of<HomePageCubit>(context).getCategoriesData();
  }

  var SearchCubitDUMMY_CATEGORIES;
  final search_controller = TextEditingController();
  String img = 'img/mmcassits/';

  List<String> Images = [
    '1.png',
    '2.png',
    '3.png',
    '4.png',
  ];
  @override
  Widget build(BuildContext context) {
    SearchCubitDUMMY_CATEGORIES =
        context.read<HomePageCubit>().categoryDataList;
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(create: (BuildContext context) {
          return SearchCubit(SearchCubitDUMMY_CATEGORIES, context);
        }),
        BlocProvider<VisibilityCubit>(
          create: (BuildContext context) => VisibilityCubit(),
        ),
        BlocProvider<ServicesCubit>(
          create: (BuildContext context) => ServicesCubit(),
        ),
      ],
      child: Scaffold(
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    //appbar
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.h),
                              bottomRight: Radius.circular(25.h))),
                      // height: 160.h,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                child: LeftAppBarUpdate()),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(S.of(context).Home_title1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .merge(
                                          GoogleFonts.aBeeZee(),
                                        )),
                                Text(S.of(context).Home_title2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .merge(
                                          GoogleFonts.aBeeZee(),
                                        )),
                              ],
                            ),
                            BlocBuilder<SearchCubit, searchState>(
                                builder: (context, state) {
                              return searchbar(
                                DUMMY_CATEGORIES: SearchCubitDUMMY_CATEGORIES,
                                search_controller: search_controller,
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    //body
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 10.h),
                      child: Column(
                        children: [
                          Align(
                            alignment:
                                Localizations.localeOf(context).languageCode ==
                                        'ar'
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: Text(
                                S.of(context).choose_maintenance_service,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .merge(
                                        GoogleFonts.aBeeZee(fontSize: 17.h))),
                          ),
                          /////////////////////////
                          categoriesScreen(),
                          ///////////////////////////
                          Container(
                              height: 150.h,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  autoPlayInterval:
                                      Duration(milliseconds: 4500),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 1500),
                                  height: 300.0,
                                  autoPlay: true,
                                ),
                                items: Images.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Image.asset(img + i);
                                    },
                                  );
                                }).toList(),
                              ))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
/////////////*********************************************************//////////////////


