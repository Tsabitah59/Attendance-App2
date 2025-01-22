import 'dart:io';

import 'package:attendence_app/ui/attend/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;

  const AttendanceScreen({super.key, this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  
  _AttendanceScreenState(this.image);

  XFile? image;

  // Timestamp
  String strAddress = "", date = "", time = "", dateTime = "", status = "Attend";

  bool isLoading = false;

  // Kordinat posisi (Pake Geolocation)
  double lat = 0.0, long = 0.0;

  // Waktu (Jam)
  int dateHours = 0, minute = 0;

  // Controller buat text di formnya nanti
  final controller = TextEditingController();

  // Menghubungkan ke Firebase
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');


  @override
  void initState() {
    handleLocationPermission();
    setDateTime();
    setAttendStatus();

    // Jika image-nya udah keisi
    if (image != null) {
      isLoading = true;
      getGeolocationPosition();
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/fi-rr-angle-left.svg'
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Attendance Report"
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/fi-rr-man-head.svg'
                    ),
                    Text(
                      "Scan Your Face",
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Text(
                  "Capture Image",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => CameraScreen())
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  width: size.width,
                  height: 150,
                  child: DottedBorder(
                    radius: Radius.circular(10),
                    borderType: BorderType.RRect,
                    color: Colors.blueAccent,
                    strokeWidth: 1,
                    dashPattern: [5, 5],
                    child: FittedBox(
                      child: image != null
                      ? Image.file(File(image!.path), fit: BoxFit.cover)
                      : SvgPicture.asset('assets/icons/fi-rr-camera.svg')
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Your Name",
                    hintText: "Rukkhadevata",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.blueAccent)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}