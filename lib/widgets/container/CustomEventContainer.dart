import 'package:flutter/material.dart';

class CustomEventContainer extends StatelessWidget {
  final Color circleColor;
  final String text;

  CustomEventContainer({
    required this.circleColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFF8F9BB3)),
        borderRadius: BorderRadius.circular(10), // Border radius
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 8,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: circleColor,
                ),
              ),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8F9BB3),
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    // Action when accept button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen,
                  ),
                  child: Text('Accepter'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    // Action when refuse button is pressed
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                  child: Text(
                    'Refuser',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
