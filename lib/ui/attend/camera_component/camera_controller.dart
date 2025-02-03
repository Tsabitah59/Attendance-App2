import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraControllerComponent{

  // Kamera itu bisa null atau tidak, tergantung hardware
  List<CameraDescription>? cameras;
  CameraController? controller;
  bool isBusy = false;

  Future<void> loadCamera() async{
    cameras = await availableCameras();

    // Jika kameranya bekerja
    if (cameras != null && cameras!.isNotEmpty) {
      // cameras![0] => Pake kamera depan ketika available
      // ResolutionPreset.high => buat match data kalo in case gambarnya blur
      controller = CameraController(cameras![0], ResolutionPreset.high);
      await controller!.initialize();
    } 
  }

  Widget buildCameraPreview() {
    // Kalo kamera gak ready (di kondisi kedua berarti controllernya gak terinisiallisaii)
    if (controller == null || !controller!.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // Kalo kamera ready
    return CameraPreview(controller!);
  }
}

/** 
 * Kamera Available: Ketika user buka aplikasi dan kameranya bersedia/lancar
 * 
 * Kamera Unavailable: ketika kamera ngelag atau user tidak mengizinkan
*/ 