import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/login.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return homepage();
          } else {
            return login();
          }
        },
      ),
    );
  }
}
