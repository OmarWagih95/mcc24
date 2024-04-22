import 'package:MCC/model/network/categoriesNetwork.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  // final CollectionReference _categories =FirebaseFirestore.instance.collection('categories');
  // Reference get firebaseStorage => FirebaseStorage.instance.ref();
  List<Categoryy> categoryDataList=[];
  getCategoriesData()async{
      emit(HomePageGetDataLoading());
      try{
        categoryDataList.clear();
    categoryDataList=await CategoriesNetwork().getCategoriesData(categoryDataList);
    emit(HomePageGetDataSuccessed());
      }
      catch(e){
        emit(HomePageGetDataFailure(e.toString()));
      }

    }
  bool darkMode=false;
changeSwitch(bool x){
  darkMode=x;
  emit(changingSwitchState());
}


//  getCategoriesData ()async{
  //   emit(HomePageGetDataLoading());
  //   try{
  //     List<QueryDocumentSnapshot> categoryDataQueryList =[];
  //     categoryDataList.clear();
  //     QuerySnapshot querySnapshot = await _categories.get();
  //     categoryDataQueryList.addAll(querySnapshot.docs);
  //     for(int i =0; i<categoryDataQueryList.length ; i++){
  //       var URL =await  getCategorisImg(categoryDataQueryList[i]['logoIMG']);
  //       print (URL);
  //       categoryDataList.add (
  //           Categoryy(id: categoryDataQueryList[i].id, AR: categoryDataQueryList[i]['AR'], EN: categoryDataQueryList[i]['EN'],
  //               logoImgURL:URL)
  //         // Categoryy(id: element.id, title: element['EN']['categoryName'],element['AR'])
  //       );
  //
  //     }
  //   print('hna flcubit');
  //       print('${categoryDataList.length} +here');
  //   emit(HomePageGetDataSuccessed());
  //
  //   }
  //   catch(e){
  //     print(e);
  //     emit(HomePageGetDataFailure(e.toString()));
  //   }
  // }
  // Future<String?> getCategorisImg(String img) async{
  //   try{
  //     var urlRef = await firebaseStorage.child('images').child(img);
  //     var imgUrl = await urlRef.getDownloadURL();
  //     return imgUrl;
  //
  //   }
  //   catch(e){
  //     print (e);
  //   }
  //
  //   // if (urlRef != null){
  //   //
  //   // return storageImg;
  //   // }
  // }
}
