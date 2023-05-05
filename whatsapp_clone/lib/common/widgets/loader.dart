import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: tabColor,
      ),
    );
  }
}
