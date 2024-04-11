// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:MCC/cubits/LanguagesCupit.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/model/dummyData.dart';
import 'package:MCC/model/userModel.dart';
import 'package:MCC/services/Network_data_services.dart';
import 'package:flutter/material.dart';
import '../../cubits/auth_cubit.dart';
import '../../cubits/home_page_cubit.dart';
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
GlobalKey<NavigatorState> HomePageNavigatorKey = GlobalKey<NavigatorState>();


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    late userModel? user = BlocProvider.of<AuthCubit>(context).user;
    // TODO: implement initState
    // print(BlocProvider.of<AuthCubit>(context).user!.userID!);
    getUserDate()async{
      print('hna1');
      try{

      user= await BlocProvider.of<AuthCubit>(context).getUserData();
      print('${ user!.userID!} test main user');
      }
      catch(e){
        print(e);
      }

    }
    try {

      getUserDate();
      print('userData tmaaam');
    }
    catch(e){
      print(e);
    }
    BlocProvider.of<HomePageCubit>(context).getCategoriesData();

  }
  var SearchCubitDUMMY_CATEGORIES;
  final search_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SearchCubitDUMMY_CATEGORIES =
        context.read<HomePageCubit>().categoryDataList;
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(create: (BuildContext context) {
          return SearchCubit(SearchCubitDUMMY_CATEGORIES,context);
        }),
        BlocProvider<VisibilityCubit>(
          create: (BuildContext context) => VisibilityCubit(),
        ),
        BlocProvider<ServicesCubit>(
          create: (BuildContext context) => ServicesCubit(),
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
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                    )
                  ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
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
                          DUMMY_CATEGORIES: SearchCubitDUMMY_CATEGORIES,
                          search_controller: search_controller,
                        );
                      }),
                      Align(
                        alignment:
                            Localizations.localeOf(context).languageCode == 'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Text(
                          S.of(context).choose_maintenance_service,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Align(
                          alignment:
                              Localizations.localeOf(context).languageCode ==
                                      'ar'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Text(S
                              .of(context)
                              .then_get_best_prices_from_our_suppliers)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          categoriesScreen(),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ))),
    );
  }
}
/////////////*********************************************************//////////////////


