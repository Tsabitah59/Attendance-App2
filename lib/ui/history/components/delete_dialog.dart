import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {

  final String documentId;
  final CollectionReference dataCollection;

  const DeleteDialog({super.key, required this.documentId, required this.dataCollection});

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
            dataCollection.doc(documentId).delete();
            Navigator.pop(context);
          }, 
        ),

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