import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';

class CustomButton extends StatelessWidget {
  late String text;
  VoidCallback onpressed;
  CustomButton({required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(
        text,
        style: TextStyle(color: blackColor),
      ),
      style: ElevatedButton.styleFrom(
          primary: tabColor, minimumSize: Size(double.infinity, 50)),
    );
  }
}
