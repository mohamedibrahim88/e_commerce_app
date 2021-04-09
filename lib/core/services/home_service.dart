import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryRef= FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productRef= FirebaseFirestore.instance.collection('Products');


  Future<List<QueryDocumentSnapshot>> getCategory() async{

    var value = await _categoryRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async{

    var value = await _productRef.get();

    return value.docs;
  }
}
