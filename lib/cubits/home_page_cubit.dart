import 'package:MCC/model/network/categoriesNetwork.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  List<Categoryy> categoryDataList = [];
  getCategoriesData() async {
    emit(HomePageGetDataLoading());
    try {
      categoryDataList.clear();
      categoryDataList =
          await CategoriesNetwork().getCategoriesData(categoryDataList);
      emit(HomePageGetDataSuccessed());
    } catch (e) {
      emit(HomePageGetDataFailure(e.toString()));
    }
  }

  bool darkMode = false;
  changeSwitch(bool x) {
    darkMode = x;
    emit(changingSwitchState());
  }
}
