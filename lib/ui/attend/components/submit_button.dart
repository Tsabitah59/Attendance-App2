import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container buildSubmitButton(BuildContext context, Size size, XFile? image, TextEditingController controllerName, String address, String status, String timeStamp) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(10),
    child: Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(18),
          color: Colors.blueAccent,
          child: InkWell(
            splashColor: Colors.blue,
            borderRadius: BorderRadius.circular(18),
            onTap: () {
              if (image == null || controllerName.text.isEmpty) {
                // showSnackBar();
                // TODO - SAMPE SINI AWOKAWOK KALAH KOK SAMA BELL
              } else {
                
              }
            },
          ),
        ),
      ),
    ),
  );
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        spacing: 10,
        children: [
          SvgPicture.asset(
            'assets/icons/fi-rr-info.svg'
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
      backgroundColor: Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    )
  );
}