import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const FormHeader({super.key, required this.title, required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        spacing: 20,
        children: [
          Icon(icon),
          Text(title)
        ],
      ),
    );
  }
}