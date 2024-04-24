import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String subtitle;
  final String imagePath;

  CustomContainer({
    required this.text,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 98,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            imagePath,
            width: 72,
            height: 82,
          ),
        ],
      ),
    );
  }
}
