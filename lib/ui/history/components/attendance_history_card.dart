import 'dart:math';

import 'package:attendence_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onDelete;

  const AttendanceHistoryCard({super.key, required this.data, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DeleteDialog(
          documentId: data['id'], 
          dataCollection: FirebaseFirestore.instance.collection('attendance'),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            spacing: 10,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  // Biar warna yang muncul tuh random
                  color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Text(
                    // Nama dari data di firestore
                    data['name'][0].toUpperCase(),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text('Name')
                        ),
                        Text(
                          data['name']
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Status"),
                        Text(
                          data['description']
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}