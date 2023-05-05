import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:video_lead/screens/loginsignupcheck.dart';
import 'package:video_lead/screens/signup.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBx3WdD0CwWCxlNFG3TKczvDLSmQun8ncs",
          authDomain: "video-lead.firebaseapp.com",
          projectId: "video-lead",
          storageBucket: "video-lead.appspot.com",
          messagingSenderId: "110171036420",
          appId: "1:110171036420:web:1f9b92812ec7f0bcbf4e51"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: logincheck(),
      ),
    );
  }
}
