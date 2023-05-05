import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tut_1/firebase_options.dart';
import 'package:tut_1/homepage.dart';
import 'package:tut_1/login.dart';
import 'package:tut_1/mainpage.dart';
import 'package:tut_1/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/': (context) => login()},
      debugShowCheckedModeBanner: false,
      home: register(),
    );
  }
}
