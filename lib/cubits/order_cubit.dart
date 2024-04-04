import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  String? userID;
  String? serviceID;
  String? description;
  String? phoneNumber;
  String? Address;
  bool active =true;
  OrderCubit() : super(OrderInitial());
}
