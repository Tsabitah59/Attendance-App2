import 'package:attendence_app/services/data_service.dart';
import 'package:attendence_app/ui/history/components/attendance_history_card.dart';
import 'package:attendence_app/ui/history/components/delete_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),

      body: StreamBuilder(
        // Snapshots digunakan untuk memberitahu UI untuk menghandle data
        stream: dataService.dataCollection.snapshots(), 
        // Build untuk membangun widget UI
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // Jika snapshot tidak ada datanya
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                'No data ._.'
              ),
            );
          }

          // Docs adalah representasi dari firebase 
          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return AttendanceHistoryCard(
                // Untuk mendefinisikan data yang akan muncul di UI berdasarkan index (posisi) yang ada di database
                data: data[index].data() as Map<String, dynamic>, 
                onDelete: () {
                  showDialog(
                    context: context, 
                    builder: (context) => DeleteDialog(
                      // Untuk menjadikan index sebagai ID dari data di Database
                      documentId: data[index].id, 
                      dataCollection: dataService.dataCollection,
                      // Pembaruan state setelah penghapusan data di database
                      onConfirm: () {
                        setState(() {
                          dataService.deleteData(data[index].id);
                          Navigator.pop(context);
                        });
                      },

                    )
                  );
                }
              );
            }
          );
        }
      ),
    );
  }
}