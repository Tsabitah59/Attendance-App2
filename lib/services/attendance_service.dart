
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

Future<void> submitReport (BuildContext context, String address, name, status,) async{
  // showLoaderDialog(context);
}

