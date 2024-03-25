import 'package:flutter/material.dart';
import 'package:test2/my_tools/colors.dart';
class  MyButton extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed; // Add this line

  const MyButton({
    Key? key,
    required this.txt,
    required this.onPressed, // Mark onPressed as required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ), style: ElevatedButton.styleFrom(minimumSize: Size(305, 57), shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),),
          primary: MyButtonColor, // Ajout de la couleur FA7F35



        )
    );
  }
}
class SubButton extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;
  const SubButton({
    required this.txt,
    required this.onPressed,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
        txt,
        style: TextStyle(
        fontSize: 18,
        color: Colors.orange,
    ),
    ),
    );
  }
}

