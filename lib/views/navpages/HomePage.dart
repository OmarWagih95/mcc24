// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/model/dummyData.dart';
import 'package:flutter/material.dart';
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
    SearchCubitDUMMY_CATEGORIES = DUMMY_CATEGORIES_(context);
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
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftappbar(),
                      Text(
                        'MCC',
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                  BlocBuilder<VisibilityCubit, VisibilityState>(
                      builder: (context, state) {
                    return messageText(
                      isVisible: state.isVisible,
                    );
                  }),
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
                  categoriesScreen()
                ],
              ),
            ),
          ))),
    );
  }
}
/////////////*********************************************************//////////////////


