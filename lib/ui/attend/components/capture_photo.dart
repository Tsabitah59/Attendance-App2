import 'dart:io';

import 'package:attendence_app/ui/attend/camera_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/svg.dart';


Padding buildCapturePhoto(BuildContext context, Size size, XFile? image) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Captured Photo",
          style: Theme.of(context).textTheme.titleMedium,
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
              child: SizedBox.expand(
                child: FittedBox(
                  child: image != null
                  ? Image.file(File(image!.path), fit: BoxFit.cover)
                  : SvgPicture.asset('assets/icons/fi-rr-camera.svg')
                ),
              )
            ),
          )
        )
      ],
    ),
  );
}