import 'package:MCC/services/OrderServices.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  // String? userID;
  String description='';
  String phoneNumber='';
  String address='';
  bool active =true;
  GlobalKey <FormState> orderFormKey=GlobalKey();

  OrderCubit() : super(OrderInitial());
  addOrder(String userID,String serviceID)async{
    emit(OrderLoading());
    try{
      await OrderServices().addOrder(userID, serviceID, description, phoneNumber, address);
      emit(OrderSuccess());
    }
        catch(e){
      emit(OrderFailure());
        }
  }
}
