// ignore: camel_case_types

import 'package:MCC/cubits/LanguagesCupit.dart';
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
  void initState() {
    // Map <String,dynamic> lang=(context).read<HomePageCubit>().categoryDataList[0].EN;
    getCategoriesData_() async {
      await BlocProvider.of<HomePageCubit>(context).getCategoriesData();
      print('here');
    }

    getCategoriesData_();
  }

  @override
  Widget build(context) {
    Locale appLocale = Localizations.localeOf(context);
    String languageCode = appLocale.languageCode;
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
            : Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(0),
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) => categoryItem(
                      languageCode == 'en'
                          ? (context)
                              .read<HomePageCubit>()
                              .categoryDataList[index]
                              .EN['categoryName']
                          : (context)
                              .read<HomePageCubit>()
                              .categoryDataList[index]
                              .AR['categoryName'],
                      DUMMY_CATEGORIES[index].color,
                      (context)
                          .read<HomePageCubit>()
                          .categoryDataList[index]
                          .id,
                      (context)
                          .read<HomePageCubit>()
                          .categoryDataList[index]
                          .logoImgURL!),
                  itemCount:
                      (context).read<HomePageCubit>().categoryDataList.length,
                  // itemCount: BlocProvider.of<HomePageCubit>(context).categoryDataList.length,
                ));
      },
    );
  }
}
