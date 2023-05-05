import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  final double ButtonHeight;
  final double ButtonWidth;
  final dynamic ButtonColour;
  final Function ButtonFunction;
  final String ButtonText;
  final dynamic ButtonTextColor;

  const buttons(
      {required this.ButtonHeight,
      required this.ButtonWidth,
      required this.ButtonColour,
      required this.ButtonFunction,
      required this.ButtonText,
      required this.ButtonTextColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ButtonHeight,
        width: ButtonWidth,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color(ButtonColour)),
          ),
          child: Text(
            ButtonText,
            style: TextStyle(color: Color(ButtonTextColor)),
          ),
          onPressed: (() {
            ButtonFunction;
          }),
        ));
  }
}
