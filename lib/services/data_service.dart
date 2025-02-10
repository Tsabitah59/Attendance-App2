import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  // Untuk mendapatkan data
  Future<QuerySnapshot> getData() {
    return dataCollection.get();
  }

  // Untuk membuang data
  Future<void> deleteData(String docId) {
    return dataCollection.doc(docId).delete();
  }

  
}