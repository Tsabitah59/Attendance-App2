import 'package:attendence_app/ui/permission/components/snack_bar.dart';
import 'package:flutter/material.dart';

class ErorrHandler {
  static void handleError(BuildContext context, dynamic error) {
    if (error is PermissionDeniedException) {
      SnackBarComponent.showSnackBar(
        context, 
        "Permission Denied",
        isError: true,
      );
    } else {
      SnackBarComponent.showSnackBar(
        context,
        error,
        isError: true
      );
      Navigator.of(context).pop();
    }
  }
}

// implements buat mengimplementasikan class lain
class PermissionDeniedException implements Exception{
  final String message;
  // Proses pembuatan placeholder dari exception
  PermissionDeniedException([this.message = '']);

  @override
  String toString() => message.isEmpty ?  "Permission Denied" : message;
}