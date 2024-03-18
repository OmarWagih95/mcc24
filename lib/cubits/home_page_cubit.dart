import 'package:MCC/model/Network_data_model.dart';
import 'package:MCC/services/Network_data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final Externaldata cubitdata;
  HomePageCubit(this.cubitdata) : super(HomePageInitial());
  List<CategoryyModel>? isSucc;
  void DataHomePageCubit() async {
    emit(HomePageGetDataLoading());
    try {
      isSucc = await cubitdata.getCategoriesData();
      if (await cubitdata.getCategoriesData() != null) {
        emit(HomePageGetDataSuccessed(
            categories: cubitdata.getCategoriesData()));
      }
    } catch (e) {
      emit(HomePageGetDataFailure('$e'));
    }
  }
}
