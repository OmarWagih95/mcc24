// ignore: camel_case_types

import 'package:MCC/constants/colors.dart';
import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/login_cubit.dart';
import 'package:MCC/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        return state is HomePageGetDataLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400.h,
                    child: Center(
                      child: SpinKitCircle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              )
            : BlocBuilder<SearchCubit, searchState>(
                builder: (context, state) {
                  if (state is searchinitialState) {
                    categoryDataList_ =
                        (context).read<HomePageCubit>().categoryDataList;
                    return Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: const EdgeInsets.all(0),
                        height: 500.h,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2.8 / 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return categoryItem(state.filteredData[index],
                                Theme.of(context).primaryColorLight);
                          },
                          itemCount: state.filteredData
                              .length, // itemCount: BlocProvider.of<HomePageCubit>(context).categoryDataList.length,
                        ));
                  } else {
                    return Center(child: Text('some thing wrong with search'));
                  }
                },
              );
      },
    );
  }
}
