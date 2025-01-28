
import 'package:attendence_app/services/timestamp_service.dart';
import 'package:attendence_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Entry point for submitting the attendance report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

Future<void> submitAttendanceReport (BuildContext context, String address, name, status, attendanceStatus, timeStamp) async{
  showLoaderDialog(context);
  dataCollection.add(
    {
      'address' : address,
      'name' : name,
      'description' : attendanceStatus,
      'time' : timeStamp
    }
  ).then((result) {
    Navigator.of(context).pop();
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            spacing: 10,
            children: [
              SvgPicture.asset(
                'assets/icons/fi-rr-check.svg',
              ),
              Text(
                "Attendance submitted successfully"
              )
            ],
          ),
          backgroundColor: Colors.orangeAccent,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        )
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            spacing: 10,
            children: [
              SvgPicture.asset(
                'assets/icons/fi-rr-info.svg',
              ),
              Expanded(
                child: Text(
                  "Ups, $e"
                ),
              )
            ],
          ),
          backgroundColor: Colors.orangeAccent,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        )
      );
      
    }
  });
}

void showLoaderDialog(BuildContext context) {
  AlertDialog dialog = AlertDialog(
    content: Row(
      children: [
        // Loading Lingkaran yang basic lah kalo tau awokaowk
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),

        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Checking the data 💫"
          ),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

