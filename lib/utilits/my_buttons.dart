import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {

  final String text;
  VoidCallback onPressed;
  final Color textColor;

   MyButtons({super.key,
    required this.text,
  required this.onPressed,
   required this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    color: Colors.yellow[500],
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
