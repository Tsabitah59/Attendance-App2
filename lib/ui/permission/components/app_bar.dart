import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/icons/fi-rr-arrow-left.svg'
      ),
      onPressed: () => Navigator.of(context).pop(), 
    ),
    title: Text(
      "Permission"
    ),

    
  );
}