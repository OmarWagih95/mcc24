// ignore: camel_case_types

import 'package:MCC/cubits/SearchCupit.dart';
import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/cubits/user_cubit.dart';
import 'package:MCC/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cubits/home_page_cubit.dart';
import '/widgets/category_item.dart';
import '/model/dummyData.dart';

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
    print(context.read<UserCubit>().userModel.phoneNumber);
    List<Category> DUMMY_CATEGORIES = DUMMY_CATEGORIES_(context);
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state is HomePageGetDataFailure) {
          print('there\'s an error retreiving your data');
          Fluttertoast.showToast(msg: state.errorMsg);
        }
      },
      builder: (context, state) {
        return state is HomePageGetDataLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 400,
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
                    var categoryDataList_ =
                        (context).read<HomePageCubit>().categoryDataList;
                    return Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(0),
                        height: 500,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return categoryItem(
                              state.filteredData[index],
                              DUMMY_CATEGORIES[index].color,
                            );
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
