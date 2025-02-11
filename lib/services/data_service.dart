import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  // Untuk mendapatkan data
  Future<QuerySnapshot> getData() {
    // get() adalah salah satu method yang disediakan oleh firebase
    // Untuk mendapat atau membaca data
    return dataCollection.get();
  }

  // Untuk membuang data dari database
  Future<void> deleteData(String docId) {
    return dataCollection.doc(docId).delete();
  }
}