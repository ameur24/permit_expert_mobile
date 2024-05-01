import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../Notification/notification.dart';
import '../profile/profilep1.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<dynamic> _selectedEvents = [];

  final Map<DateTime, List<dynamic>> events = {};

  Map<DateTime, List<dynamic>> _events = {
    DateTime.utc(2024, 4, 8): ['Réunion', 'Déjeuner'],
    DateTime.utc(2024, 4, 10): ['Conférence'],
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
    Intl.defaultLocale = 'fr_FR';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text(
                'Votre calendrier',
                style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.to(NotificationsScreen());
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.to(ProfilePage());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          TableCalendar(
            locale: 'fr_FR',
            firstDay: DateTime.utc(2010, 10, 11),
            lastDay: DateTime.utc(2030, 3, 17),
            startingDayOfWeek: StartingDayOfWeek.monday,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },

            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                color: Colors.orange,
              ),
              todayTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                color: Colors.lightGreen,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
            ),

            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonShowsNext: false,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.black,
              ),
              titleTextFormatter: (date, locale) {
                String monthText = DateFormat.MMMM(locale).format(date);
                String yearText = DateFormat.y(locale).format(date);
                return '${monthText[0].toUpperCase()}${monthText.substring(1)}\n' +
                    '$yearText';
              },
              headerMargin: EdgeInsets.only(bottom: 10, top: 10),
            ),
          ),

          if (_selectedEvents.isEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Aucun événement',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                'assets/images/sarra2-removebg-preview.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = selectedDay;
        _selectedEvents = _getEventsForDay(selectedDay);
      });
    }
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }
}
