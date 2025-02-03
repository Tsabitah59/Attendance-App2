import 'package:attendence_app/ui/attend/camera_component/camera_controller.dart';
import 'package:attendence_app/ui/attend/camera_component/face_detector.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with TickerProviderStateMixin{
  late CameraControllerComponent cameraControllerComponent;
  late FaceDetectorComponent faceDetectorComponent; 

  @override
  void initState() {
    super.initState();
    cameraControllerComponent = CameraControllerComponent();
    faceDetectorComponent = FaceDetectorComponent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameraControllerComponent.buildCameraPreview(),
    );
  }
}