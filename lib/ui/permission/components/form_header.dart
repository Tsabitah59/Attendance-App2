import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String icon;

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
          SvgPicture.asset(icon),
          Text(title)
        ],
      ),
    );
  }
}