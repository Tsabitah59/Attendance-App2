import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container buildHeader(context) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18)
      )
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          '/assets/icons/face'
        ),
        Text(
          'Please take a picture',
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    ),
  );
}