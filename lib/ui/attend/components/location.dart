import 'package:flutter/material.dart';

Padding buildLocationSection(bool isLoading, String address, BuildContext context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Location",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        isLoading 
        ? Center(
          child: CircularProgressIndicator(
            color: Colors.lightBlueAccent,
          ),
        )
        : Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            // Untuk mengatur tinggi textfield
            height: 5 * 24,
            child: TextField(
              enabled: false,
              maxLines: 5,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Colors.blueAccent)
                ),
                hintText: address.isNotEmpty ? address : "Your Location",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                fillColor: Colors.transparent,
                filled: true
              ),
            ),
          ),
        )
      ],
    ),
  );
}