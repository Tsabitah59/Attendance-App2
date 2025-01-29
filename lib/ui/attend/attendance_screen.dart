import 'package:attendence_app/services/location_service.dart';
import 'package:attendence_app/services/timestamp_service.dart';
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
      appBar: AppBar(
        
      ),
    );
  }
}