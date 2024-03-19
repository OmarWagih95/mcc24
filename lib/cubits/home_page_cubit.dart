import 'dart:async';

import 'package:MCC/model/Network_data_model.dart';
import 'package:MCC/services/Network_data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final Externaldata cubitdata;
  HomePageCubit(this.cubitdata) : super(HomePageInitial());
  List<CategoryyModel> categoryDataList = [];
  void DataHomePageCubit() async {
    emit(HomePageGetDataLoading());
    try {
      categoryDataList = await cubitdata.getCategoriesData();
      if (categoryDataList.length > 0) {
        emit(HomePageGetDataSuccessed(categories: categoryDataList));
      }
    } catch (e) {
      emit(HomePageGetDataFailure('$e'));
    }
  }
}
