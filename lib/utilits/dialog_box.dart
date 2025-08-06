import 'package:flutter/material.dart';
import 'package:todoapp2/utilits/my_buttons.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({super.key,
    required this.controller,
  required this.onSave,
  required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[100],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get User input
            TextField(
              controller: controller ,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add your Task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            //   buttons
              children: [
                MyButtons(text: "Save", onPressed:onSave,
                  textColor: Colors.black,
                ),
                const SizedBox(width: 8),
                MyButtons(text: "Cancel",onPressed:onCancel ,
                  textColor: Colors.black,)
              ],
            )
          ],
        ),
      ),

    );
  }
}
