import 'package:MCC/model/network/servicesNetwork.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

import '../model/service.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());
  final CollectionReference _services =FirebaseFirestore.instance.collection('services');
  Reference get firebaseStorage => FirebaseStorage.instance.ref();
  List<Service> servicesDataList=[];
  getServicesData(String categoryID)async{
    emit(ServicesPageLoading());
    try{
      servicesDataList=await  ServicesNetwork().getServicesData(categoryID, servicesDataList);
      emit(ServicesPageSuccess());
    }
    catch(e){
      emit(ServicesPagaeFailure(e.toString()));
    }
  }


}
