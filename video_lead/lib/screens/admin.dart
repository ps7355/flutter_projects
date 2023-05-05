import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Container(
          color: Colors.black,
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          color: Colors.white,
        ),
      ),
    ]);
  }
}
