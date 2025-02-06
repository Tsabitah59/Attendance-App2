import 'package:attendence_app/services/attendance_service.dart';
import 'package:attendence_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.size,
    required this.nameController,
    required this.toController,
    required this.dropValueCategories, 
    required this.fromController, required CollectionReference<Map<String, dynamic>> dataCollection
  });

  final Size size;
  final TextEditingController nameController;
  final TextEditingController fromController;
  final TextEditingController toController;
  final String dropValueCategories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        width: size.width,
        child: ElevatedButton(
          onPressed: () => _submitHandler(context), 
          child: Text(
            "Submit"
          )
        ),
      ),
    );
  }

  // Semua method yang butuh context akan mengambil context terdekat
  void _submitHandler(BuildContext context) {
    if (_isFormValid()) {
      // Sub function
      _submitForm(context);
    } else {
      _showSnackBar(context,
       "Please fill all fields correctly", 
       'assets/icons/fi-rr-exclamation.svg', 
       Colors.red
      );
    }
  }

  bool _isFormValid() {
    return nameController.text.isNotEmpty &&
    dropValueCategories != "Please Choose" &&
    fromController.text.isNotEmpty &&
    toController.text.isNotEmpty;
  }

  void _showSnackBar(BuildContext context, String message, String icon, Color color){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          SvgPicture.asset(icon),
          Text(message)
        ],
      ),
      backgroundColor: color,
      shape: const StadiumBorder(),
    ));
  }

  void _showLoaderDialog(BuildContext context) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
              )
            ],
          ),
        );
      },
      barrierDismissible: false,
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    _showLoaderDialog(context);
    try {
      await dataCollection.add({
        'address' : '-',
        'name' : nameController.text,
        'description' : dropValueCategories,
        'timestamp' : '${fromController.text} : ${toController.text}',
      });
      Navigator.of(context).pop();
      _showSnackBar(
        context, 
        'Successfully submit the form', 
        'assets/icons/fi-rr-check.svg', 
        Colors.orangeAccent
      );
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    } catch (e) {
      Navigator.of(context).pop();
      _showSnackBar(
        context, 
        "An error ocured $e", 
        'assets/icons/fi-rr-cross.svg' ,
        Colors.grey
      );
    }
  }
}
