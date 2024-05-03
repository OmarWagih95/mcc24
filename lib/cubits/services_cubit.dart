import 'package:MCC/model/network/servicesNetwork.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/service.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesPageLoading());
  Reference get firebaseStorage => FirebaseStorage.instance.ref();
  List<Service> servicesDataList = [];
  getServicesData(String categoryID) async {
    emit(ServicesPageLoading());
    try {
      servicesDataList =
          await ServicesNetwork().getServicesData(categoryID, servicesDataList);
      debugPrint('$servicesDataList.length' );
      emit(ServicesPageSuccess(servicesDataList));
    } catch (e) {
      emit(ServicesPagaeFailure(e.toString()));
    }
  }
}
