import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});

  final String text;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onHover: (value) {
          debugPrint(value.toString());
        },
        onFocusChange: (value) {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
