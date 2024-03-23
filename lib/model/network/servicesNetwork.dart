import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../service.dart';

class ServicesNetwork{
  final CollectionReference _services =FirebaseFirestore.instance.collection('services');
  Reference get firebaseStorage => FirebaseStorage.instance.ref();
  Future<List<Service>> getServicesData (String categoryID,List<Service> servicesDataList)async{
      List<QueryDocumentSnapshot> servicesDataQueryList =[];
      servicesDataList.clear();
      QuerySnapshot querySnapshot = await _services.where('categoryID',isEqualTo:categoryID).get();
      servicesDataQueryList.addAll(querySnapshot.docs);
      for(int i =0; i<servicesDataQueryList.length ; i++){
        var URL =await  getServicesImg(servicesDataQueryList[i]['image']);
        print (URL);
        servicesDataList.add (
            Service(servicesDataQueryList[i].id,servicesDataQueryList[i]['EN'],servicesDataQueryList[i]['AR'],
                URL!)
          // Categoryy(id: element.id, title: element['EN']['categoryName'],element['AR'])
        );

      }
      print('hna flcubit');
      print('${servicesDataList.length} here');
        return servicesDataList;


    }

  Future<String?> getServicesImg(String img) async{
    try{
      var urlRef = await firebaseStorage.child('images').child('servicesImages').child(img);
      var imgUrl = await urlRef.getDownloadURL();
      print(imgUrl);
      return imgUrl;

    }
    catch(e){
      print (e);
    }

    // if (urlRef != null){
    //
    // return storageImg;
    // }
  }
  }
