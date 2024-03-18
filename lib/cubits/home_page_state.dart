part of 'home_page_cubit.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {
  HomePageInitial();
}

class HomePageGetDataSuccessed extends HomePageState {
  final Future<List<CategoryyModel>?> categories;
  HomePageGetDataSuccessed({
    required this.categories,
  });
}

class HomePageGetDataLoading extends HomePageState {}

class HomePageGetDataFailure extends HomePageState {
  String errorMsg;
  HomePageGetDataFailure(this.errorMsg);
}
