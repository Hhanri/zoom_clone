import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonWidget({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: buttonColor),
            borderRadius: BorderRadius.circular(30)
          ),
          primary: buttonColor,
          minimumSize: const Size(double.infinity, 50)
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17
          ),
        )
      ),
    );
  }
}
