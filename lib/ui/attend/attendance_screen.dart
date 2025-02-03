import 'package:attendence_app/services/location_service.dart';
import 'package:attendence_app/services/timestamp_service.dart';
import 'package:attendence_app/ui/attend/components/app_bar_comp.dart';
import 'package:attendence_app/ui/attend/components/capture_photo.dart';
import 'package:attendence_app/ui/attend/components/header.dart';
import 'package:attendence_app/ui/attend/components/location.dart';
import 'package:attendence_app/ui/attend/components/name_input.dart';
import 'package:attendence_app/ui/attend/components/submit_button.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  final XFile? image;
  const AttendanceScreen({super.key, this.image});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState(this.image);
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  _AttendanceScreenState(this.image);

  final XFile? image;

  // mengatur
  String addressPlaceholder = '',  datePlaceholder = '', timePlaceholder = '', timeStampPlaceholder = '', statusPlaceholder = 'Attend';
  bool isLoading = false;
  final controllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengatur perizinan lokasi
    handleLocationPermission(context);

    // Buat ambil data waktunya
    setDateTime((date, time, timeStamp) {
      setState(() {
        // Wadah(variable atas) = value (parameternya)
        datePlaceholder = date;
        timePlaceholder = time;
        timeStampPlaceholder = timeStamp;
      });
    });

    // Buat status attendance
    setAttendanceStatus((status) {
      setState(() {
        statusPlaceholder = status;
      });
    });
    if (image != null) {
      isLoading = true;
      getGeoLocationPosition(context, (position) {
        // Set sebelum perubahan data
        setState(() {
          isLoading = false;
          getAddressFromLongLat(position, (address) {
            setState(() {
              addressPlaceholder = address;
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          ),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              buildCapturePhoto(context, size, image),
              buildNameinputField(controllerName, context),
              buildLocationSection(isLoading, addressPlaceholder, context),
              buildSubmitButton(context, size, image, controllerName, addressPlaceholder, statusPlaceholder, timeStampPlaceholder)
            ],
          ),
        ),
      ),
    );
  }
}