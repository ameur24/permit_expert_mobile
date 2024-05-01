import 'package:flutter/material.dart';

class PaiementContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String argentText;

  PaiementContainer({
    required this.title,
    required this.subtitle,
    required this.argentText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 98,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9).withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Text(
              argentText,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}