// ignore: camel_case_types

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/cubits/services_cubit.dart';
import 'package:MCC/model/category.dart';
import 'package:MCC/views/servicesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cubits/home_page_cubit.dart';
import '/widgets/category_item.dart';

var categoryDataList_ = [];

class categoriesScreen extends StatefulWidget {
  categoriesScreen({super.key});

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  @override
  void initState() {}

  @override
  Widget build(context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state is HomePageGetDataFailure) {
          debugPrint('there\'s an error retreiving your data');
          Fluttertoast.showToast(msg: state.errorMsg);
        }
      },
      builder: (context, state) {
        return
            // state is HomePageGetDataLoading
            //     ? Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Container(
            //             height: 250.h,
            //             child: Center(
            //               child: SpinKitCircle(
            //                 color: Theme.of(context).primaryColor,
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //     :
            BlocBuilder<SearchCubit, searchState>(
          builder: (context, state) {
            if (state is searchinitialState) {
              categoryDataList_ =
                  (context).read<HomePageCubit>().categoryDataList;
              return Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
                  height: 300.h,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.8 / 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h),
                    itemBuilder: (context, index) {
                      return categoryItem(state.filteredData[index],
                          Theme.of(context).primaryColorLight);
                    },
                    itemCount: state.filteredData
                        .length, // itemCount: BlocProvider.of<HomePageCubit>(context).categoryDataList.length,
                  ));
            } else {
              return const Center(child: Text('some thing wrong with search'));
            }
          },
        );
      },
    );
  }
}

class categoryItem extends StatelessWidget {
  final Categoryy categoryy;
  final Color color;

  categoryItem(
    this.categoryy,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {
      if (state is HomePageGetDataFailure) {
        debugPrint('there\'s an error retreiving your data');
        Fluttertoast.showToast(msg: state.errorMsg);
      }
    }, builder: (context, state) {
      return GestureDetector(
        onTap: () {
          debugPrint('clicked');
          try {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) =>
                              ServicesCubit()..getServicesData(categoryy.id),
                          child: ServicesScreen(categoryy),
                        )));
          } catch (e) {
            debugPrint('$e');
          }
        },
        child: Container(
          foregroundDecoration: BoxDecoration(),
          padding: EdgeInsets.all(
              2), ////need to changed with better code for text size
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).primaryColor, width: 2),
              color: color,
              // gradient: LinearGradient(
              //     colors: [color.withOpacity(0.7), color],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              state is HomePageGetDataLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 250.h,
                          child: Center(
                            child: SpinKitCircle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Image.network(
                      categoryy.logoImgURL!,
                      height: 80.h,
                    ),
              Flexible(
                child: state is HomePageGetDataLoading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 250.h,
                            child: Center(
                              child: SpinKitCircle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Localizations.localeOf(context).languageCode ==
                                'en'
                            ? Text(categoryy.EN['categoryName'],
                                maxLines: 4,
                                style: Theme.of(context)
                                    .textTheme!
                                    .titleSmall!
                                    .merge(GoogleFonts.aBeeZee())
                                    .copyWith(overflow: TextOverflow.ellipsis))
                            : Text(categoryy.AR['categoryName'],
                                maxLines: 4,
                                style: Theme.of(context)
                                    .textTheme!
                                    .titleSmall!
                                    .merge(GoogleFonts.aBeeZee())
                                    .copyWith(overflow: TextOverflow.ellipsis)),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
