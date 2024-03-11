// ignore_for_file: camel_case_types

import 'package:androidstudiommc/model/category.dart';

abstract class searchState {}

class searchinitialState extends searchState {
  List<Category> filteredData;

  searchinitialState(this.filteredData);
}

class searchLoadingState extends searchState {}

class searchSuccessState extends searchState {}
