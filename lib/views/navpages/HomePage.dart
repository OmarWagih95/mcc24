// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:androidstudiommc/cubits/LanguagesCupit.dart';
import 'package:androidstudiommc/cubits/SearchCupit.dart';
import 'package:androidstudiommc/cubits/SearchCupitStates.dart';
import 'package:androidstudiommc/cubits/home_page_cubit.dart';
import 'package:androidstudiommc/generated/l10n.dart';
import 'package:androidstudiommc/model/category.dart';
import 'package:androidstudiommc/model/dummyData.dart';
import 'package:flutter/material.dart';
import '../categories_screan.dart';
import '/cubits/visibilityCubit.dart';
import '/widgets/homePageHelperWidgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/visibilityCubitStates.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var SearchCubitDUMMY_CATEGORIES;
  final search_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO hna mwdo3 lsearch
    SearchCubitDUMMY_CATEGORIES = DUMMY_CATEGORIES_(context);
    // SearchCubitDUMMY_CATEGORIES = context.read<HomePageCubit>().categoryDataList;

    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguagesCubit>(
          create: (BuildContext context) => LanguagesCubit(),
        ),
        BlocProvider<SearchCubit>(create: (BuildContext context) {
          return SearchCubit(SearchCubitDUMMY_CATEGORIES);
        }),
        BlocProvider<VisibilityCubit>(
          create: (BuildContext context) => VisibilityCubit(),

        ),
      ],
      child: Scaffold(

          drawer: Drawer(child: CustomDrawer()),
          body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 3,blurStyle: BlurStyle.outer,)]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        leftappbar(),
                        Text(
                          'MCC',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10)
                ,child: Column(
                  children: [
                    // BlocBuilder<VisibilityCubit, VisibilityState>(
                    //   builder: (context, state) {
                    //     return messageText(
                    //       isVisible: state.isVisible,
                    //     );
                    //   }),
                    BlocBuilder<SearchCubit, searchState>(
                        builder: (context, state) {
                          return searchbar(
                            search_controller: search_controller,
                          );
                        }),
                    Align(
                      alignment:
                      BlocProvider.of<LanguagesCubit>(context).lan == 'ar'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        S.of(context).choose_maintenance_service,
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Align(
                        alignment:
                        BlocProvider.of<LanguagesCubit>(context).lan == 'ar'
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(S
                            .of(context)
                            .then_get_best_prices_from_our_suppliers)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        BlocProvider(
                          create: (context) => HomePageCubit(),
                          child: categoriesScreen(),
                        ),
                      ],
                    )],
                ),)

              ],
            ),
          ))),
    );
  }
}
/////////////*********************************************************//////////////////


