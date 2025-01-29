import 'package:flutter/material.dart';

Padding buildNameinputField(TextEditingController controllerName, BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: TextField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      controller: controllerName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        labelText: "Your Name",
        hintText: "Rukkhadevata",
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.blueAccent)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.blueAccent)
        ),
      ),
    ),
  );
}