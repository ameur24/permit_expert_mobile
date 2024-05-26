import 'package:flutter/material.dart';

class EventContainer extends StatelessWidget {
  final String date;
  final String title;
  final String subtitle;
  final String acceptButtonText;
  final String rejectButtonText;
  final VoidCallback onAcceptPressed;
  final VoidCallback onRejectPressed;
  final bool showButtons;

  EventContainer({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.acceptButtonText,
    required this.rejectButtonText,
    required this.onAcceptPressed,
    required this.onRejectPressed,
    this.showButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 360,
        height: 105,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF8F9BB3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 10),
              child: Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFA7F35),
                ),
              ),
            ),
            SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      date,
                      style: TextStyle(
                        color: Color(0xFF8F9BB3),
                        fontSize: 11,
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF222B45),
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color(0xFF8F9BBB),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            if (showButtons) Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5),
                  child: ElevatedButton(
                    onPressed: onAcceptPressed,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9DCD5A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      acceptButtonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                    onPressed: onRejectPressed,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFA7F35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      rejectButtonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}