part of 'home_page_cubit.dart';

// @immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageGetDataSuccessed extends HomePageState {
  final List<Categoryy> data;
  HomePageGetDataSuccessed(this.data);
}

class HomePageGetDataLoading extends HomePageState {}

class HomePageGetDataFailure extends HomePageState {
  String errorMsg;
  HomePageGetDataFailure(this.errorMsg);
}
