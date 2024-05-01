import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../../widgets/container/Eventcontainer.dart';
import '../Notification/list_notifications.dart';
import '../Notification/notification.dart';
import '../profile/profilep1.dart';

class CalendarScreen2 extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen2> {
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
              Get.to(ListNotifications());
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
      body: Column(
        children: [
          Expanded(
            child: TableCalendar(
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
                headerMargin: EdgeInsets.only(bottom: 5, top: 10),
              ),
            ),
          ),
          EventContainer(
            date: '10:00-13:00',
            title: 'Séance Code',
            subtitle: 'Vous pouvez choisir entre accepter et refuser.',
          ),
          SizedBox(height: 20), // Réduire l'espacement
          EventContainer(
            date: '14:00-15:00',
            title: 'Examen Code',
            subtitle: 'Vous pouvez choisir entre accepter et refuser.',
          ),
          SizedBox(height: 50),
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