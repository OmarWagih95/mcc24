import 'package:MCC/cubits/SearchCupitStates.dart';
import 'package:MCC/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<searchState> {
  List<Categoryy> items_;
  final BuildContext context;
  SearchCubit(
    this.items_,
    this.context,
  ) : super(searchinitialState(items_));

  void filterList(String query, List<Categoryy> items) {
    if (query.isEmpty) {
      emit(searchinitialState(items));
    } else {
      emit(searchinitialState(items
          .where((item) =>
              (Localizations.localeOf(context).languageCode == 'ar')
                  ? item.AR['categoryName']
                      .toLowerCase()
                      .contains(query.toLowerCase())
                  : item.EN['categoryName']
                      .toLowerCase()
                      .contains(query.toLowerCase()))
          .toList()));
    }
  }
}
