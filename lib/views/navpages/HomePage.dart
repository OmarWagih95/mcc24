// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:androidstudiommc/generated/l10n.dart';
import 'package:androidstudiommc/model/category.dart';
import 'package:androidstudiommc/model/dummyData.dart';
import 'package:androidstudiommc/views/categories_screan.dart';
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
  final search_controller = TextEditingController();
  List<Category> filteredData = [];
  @override
  void initState() {
    filteredData.addAll(DUMMY_CATEGORIES);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Category> dummySearchList = [];
    dummySearchList.addAll(DUMMY_CATEGORIES);
    if (query.isNotEmpty) {
      List<Category> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.title.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredData.clear();
        filteredData.addAll(DUMMY_CATEGORIES);
      });
      return;
    } else {
      setState(() {
        filteredData.clear();
        filteredData.addAll(DUMMY_CATEGORIES);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VisibilityCubit(),
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
                  searchbar(
                    onChanged: filterSearchResults,
                    search_controller: search_controller,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).choose_maintenance_service,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
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


