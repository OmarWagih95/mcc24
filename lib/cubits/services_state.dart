part of 'services_cubit.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}
class ServicesPageLoading extends ServicesState {}
class ServicesPageSuccess extends ServicesState {}
class ServicesPagaeFailure extends ServicesState {
  String error;
  ServicesPagaeFailure(this.error);
}