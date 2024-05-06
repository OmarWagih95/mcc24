import 'package:MCC/model/network/categoriesNetwork.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class VidoesState {}

class VidoesInitial extends VidoesState {}

class VidoesGetDataSuccessed extends VidoesState {}

class VidoesGetDataLoading extends VidoesState {}

class VidoesGetDataFailure extends VidoesState {
  String errorMsg;
  VidoesGetDataFailure(this.errorMsg);
}

class VideosCubit extends Cubit<VidoesState> {
  VideosCubit() : super(VidoesInitial());

  String? categoryDataList = '';

  getCategoryvideo() async {
    emit(VidoesGetDataLoading());
    try {
      categoryDataList = await CategoriesNetwork().getCategorisvidoe('');
      emit(VidoesGetDataSuccessed());
    } catch (e) {
      emit(VidoesGetDataFailure(e.toString()));
    }
  }
}
