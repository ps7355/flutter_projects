//checking wheather the user is login or not

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_lead/screens/admin.dart';
import 'package:video_lead/screens/login.dart';

class logincheck extends StatelessWidget {
  const logincheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Admin();
          } else {
            return LoginPage();
          }
        }),
      ),
    );
  }
}
