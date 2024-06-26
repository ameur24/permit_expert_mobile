import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/data/controllers/calendar_controller.dart';
import 'package:test2/models/seance_model.dart';

import '../../models/examen_model.dart';

class EventContainer extends StatelessWidget {
  final String date;
  final String title;
  final String subtitle;
  final Status status;
  final Status? monitorStatus;

  final VoidCallback onAcceptPressed;
  final VoidCallback onRejectPressed;
  final bool showButtons;

  EventContainer({
    required this.date,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.onAcceptPressed,
    required this.onRejectPressed,
    this.showButtons = true,
    this.monitorStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: 360,
            height: 130,
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
                      Row(
                        children: [
                          Text(
                            statusToString(status),
                            style: TextStyle(
                              color: status == Status.accepted
                                  ? Colors.lightGreen
                                  : status == Status.awaiting
                                  ? Colors.orange
                                  : Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          if (status == Status.accepted)
                            Icon(Icons.check, color: Colors.lightGreen),
                          if (status == Status.refused)
                            Icon(Icons.cancel, color: Colors.red),
                          if (status == Status.awaiting)
                            Icon(Icons.hourglass_top, color: Colors.orange),
                        ],
                      ),
                    ],
                  ),
                ),
                if (showButtons)
                  Column(
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
                            'Accepter',
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
                            'Refuser',
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
      },
    );
  }
}
