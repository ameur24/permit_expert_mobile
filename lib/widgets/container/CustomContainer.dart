import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String text;
  final double imageWidth;
  final double imageHeight;
  final Function()? onPressed;

  const CustomContainer({
    Key? key,
    required this.color,
    required this.imagePath,
    required this.text,
    this.onPressed, required this.imageWidth, required this.imageHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 183,
        height: 261,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                  width: imageWidth,
                  height: imageHeight,
                ),
              ),

            SizedBox(height: 10),
            Container(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, fontFamily: 'Poppins', color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
