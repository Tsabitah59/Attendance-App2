import 'package:attendence_app/ui/permission/components/app_bar.dart';
import 'package:attendence_app/ui/permission/components/form_body.dart';
import 'package:attendence_app/ui/permission/components/form_header.dart';
import 'package:attendence_app/ui/permission/components/submit_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(
                  title: "Assignment", 
                  icon: 'assets/icons/fi-rr-chart-histogram.svg'
                ),
                FormBody(),
                SubmitButton(
                  size: MediaQuery.of(context).size, 
                  nameController: TextEditingController(), 
                  toController: TextEditingController(), 
                  dropValueCategories: "Dropdown", 
                  fromController: TextEditingController(),
                  dataCollection:FirebaseFirestore.instance.collection('dataCollection')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}