part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class AddingOrderLoadingState extends OrderState {}
class AddingOrderSuccessState extends OrderState {}
class AddingOrderFailureState extends OrderState {}
class GettingMyOrdersLoadingState extends OrderState {}
class GettingMyOrdersSuccessState extends OrderState {}
class GettingMyOrdersFailureState extends OrderState {}
