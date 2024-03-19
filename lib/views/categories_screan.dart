// ignore: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../cubits/home_page_cubit.dart';
import '/widgets/category_item.dart';

class categoriesScreen extends StatefulWidget {
  categoriesScreen({
    super.key,
  });

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  @override
  void initState() {
    BlocProvider.of<HomePageCubit>(context).DataHomePageCubit();
    super.initState();
  }

  @override
  Widget build(context) {
    String languageCode = Localizations.localeOf(context).languageCode;
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {
        if (state is HomePageGetDataFailure) {
          print('there\'s an error retreiving your data');
          Fluttertoast.showToast(msg: state.errorMsg);
        }
      },
      builder: (context, state) {
        if (state is HomePageGetDataSuccessed) {
          return Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(0),
              height: 500,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return categoryItem(
                        languageCode == 'ar'
                            ? '${state.categories[index].AR['categoryName']}'
                            : '${state.categories[index].EN['categoryName']}',
                        Colors.black.withOpacity(0.3),
                        state.categories[index].id,
                        '${state.categories[index].logoImgURL}');
                  },
                  itemCount: state.categories.length));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                child: const Center(
                  child: SpinKitCircle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
