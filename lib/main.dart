import 'package:attendence_app/ui/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // data diambil dari data-services.json
    options: FirebaseOptions(
      apiKey: 'AIzaSyBEMJXuAlAWZ1LtXSFBYUSXEwjjoiz5CmM', // current_key
      appId: '638891614639', // mobilesdk_app_id 
      messagingSenderId: '638891614639', // project_number
      projectId: 'attandance-app-ae815' // project_id
    )
  );

  runApp(AttandanceApp());
}

class AttandanceApp extends StatelessWidget {
  const AttandanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: CardTheme(surfaceTintColor: Colors.amber),
        dialogTheme: DialogTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.orange,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),

      home: HomeScreen(),
    );
  }
}