import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Vision {
  Vision._();

  static final Vision instance = Vision._();

  Future<FaceDetector> faceDetector([FaceDetectorOptions? option]) async {
    return FaceDetector(options: option ?? FaceDetectorOptions());
  }
}