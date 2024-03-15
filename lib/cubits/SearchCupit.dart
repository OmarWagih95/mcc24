import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<searchState> {
  List<Category> items_;
  SearchCubit(this.items_) : super(searchinitialState(items_));

  void filterList(String query, List<Category> items) {
    // emit(searchLoadingState());
    if (query.isEmpty) {
      emit(searchinitialState(items));
    } else {
      emit(searchinitialState(items
          .where(
              (item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList()));
    }
    // emit(searchSuccessState());
  }
}
