// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:MCC/constants/colors.dart';
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
import 'package:MCC/widgets/leftappbarUpdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
              child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Container(
                //   decoration: BoxDecoration(boxShadow: [
                //     BoxShadow(
                //       color: Colors.black54,
                //       blurRadius: 3,
                //       blurStyle: BlurStyle.outer,
                //     )
                //   ]),
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         leftappbar(),
                //         // Text(
                //         //   'MCC',
                //         //   style: TextStyle(fontSize: 24),
                //         // )
                //       ],
                //     ),
                //   ),
                // ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:BorderRadius.only(bottomLeft: Radius.circular(25.h),bottomRight: Radius.circular(25.h))
                      ),
                    // height: 160.h,
                      width: double.infinity
                      ,
                    child:
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(

                        children: [     Container(
                            width: double.infinity,
                            child: LeftAppBarUpdate()
                        ),
                          SizedBox(height: 10.h,),
                          Text('Dedicated to perfection,',style: Theme.of(context).textTheme.titleLarge!.merge(GoogleFonts.aBeeZee(
                              // ,fontSize: 20.h
                          ),)),
                          Text('every single time',
                            style: Theme.of(context).textTheme.titleLarge!.merge(GoogleFonts.aBeeZee()),
                          // GoogleFonts.aboreto(
                          //     color:,
                          //     fontWeight: FontWeight.bold
                          //     ,fontSize: 20.h
                          // ),
                          ),
                          BlocBuilder<SearchCubit, searchState>(
                              builder: (context, state) {
                                return searchbar(
                                  DUMMY_CATEGORIES: SearchCubitDUMMY_CATEGORIES,
                                  search_controller: search_controller,
                                );
                              }),],
                      ),
                    ),
                        ),

                    // BlocBuilder<VisibilityCubit, VisibilityState>(
                    //   builder: (context, state) {
                    //     return messageText(
                    //       isVisible: state.isVisible,
                    //     );
                    //   }),
Padding(
  padding:  EdgeInsets.symmetric(horizontal: 15.h,vertical: 10.h),
  child: Column(
    children: [    Align(
      alignment:
      Localizations.localeOf(context).languageCode == 'ar'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        S.of(context).choose_maintenance_service,
        style: Theme.of(context).textTheme.titleLarge!.merge(GoogleFonts.aBeeZee(
          fontSize: 17.h
        ))
        // TextStyle(
        //     fontSize: 20, fontWeight: FontWeight.w700,color: ColorsManager.Color60Light),
      ),
    ),
      // Align(
      //     alignment:
      //     Localizations.localeOf(context).languageCode ==
      //         'ar'
      //         ? Alignment.centerRight
      //         : Alignment.centerLeft,
      //     child: Text(S
      //         .of(context)
      //         .then_get_best_prices_from_our_suppliers)),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          categoriesScreen(),
        ],
      )],
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


