import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {

  final String documentId;
  final CollectionReference dataCollection;

  const DeleteDialog({super.key, required this.documentId, required this.dataCollection, required Null Function() onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Delete Data?"
      ),

      content: Text(
        "Are you sure to delete this data?"
      ),
      actions: [
        TextButton(
          child: Text("Of Course!"),
          onPressed: () {
            // Melakukan penghapusan data darii database dengan method dari data_service.dart
            dataCollection.doc(documentId).delete();
            Navigator.pop(context);
          }, 
        ),
        
        // Cuma buat menutup dialog
        TextButton(
          child: Text("No Pls ._."),
          onPressed: () {
            Navigator.pop(context);
          }, 
        ),
      ],
    );
  }
}