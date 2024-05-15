import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../data/controllers/calendar_controller.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/container/Eventcontainer.dart';
import 'package:intl/intl.dart';

class CalendarScreen2 extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Votre calendrier',
          style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed(RouteHelper.notifications);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.toNamed(RouteHelper.profile);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Obx(
                      () => TableCalendar(
                    locale: 'fr_FR',
                    firstDay: DateTime.utc(2010, 10, 11),
                    lastDay: DateTime.utc(2030, 3, 17),
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    focusedDay: controller.focusedDay.value,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDay.value, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.onDaySelected(selectedDay, focusedDay);
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
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () => controller.seances.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Aucun événement',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 5),
                  Image.asset(
                    'assets/images/sarra2-removebg-preview.png',
                    width: 300,
                    height: 300,
                  ),
                ],
              )
                  : ListView.builder(
                itemCount: controller.seances.length,
                itemBuilder: (context, index) {
                  final seance = controller.seances[index];
                  return EventContainer(
                    date: '${seance.heureDebut}-${seance.heureFin}',
                    title: seance.type,
                    subtitle: 'Vous pouvez choisir entre accepter et refuser.',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
