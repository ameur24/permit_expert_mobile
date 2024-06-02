import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:test2/models/examen_model.dart';
import 'package:test2/utils/utils.dart';
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
          'Votre_calendrier'.tr,
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Obx(() => TableCalendar(
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
                        markerDecoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
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
                          return '${monthText[0].toUpperCase()}${monthText.substring(1)}\n$yearText';
                        },
                        headerMargin: EdgeInsets.only(bottom: 5, top: 10),
                      ),
                      eventLoader: (day) {
                        return controller.eventDays
                            .where((eventDay) => isSameDay(eventDay, day))
                            .toList();
                      },
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.seances.isEmpty && controller.examens.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Aucun_événement'.tr,
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
                    );
                  } else {
                    return ListView(
                      children: [
                        ...controller.seances.map((seance) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: EventContainer(
                              date: '${seance.heureD}-${seance.heureF}',
                              title: "Séance " + seance.type,
                              subtitle: (seance.candidat_status == Status.awaiting) ||(seance.moniteur_status == Status.awaiting)||
                                  (seance.candidat_status == Status.awaiting && seance.moniteur_status == Status.awaiting)
                                  ? 'Vous pouvez choisir entre accepter et refuser.'
                                  : ' ',
                              showButtons: userRole == Roles.moniteur
                                  ? seance.moniteur_status == Status.awaiting
                                  : seance.candidat_status == Status.awaiting,
                              onAcceptPressed: () {
                                controller.acceptSeance(seance.id);
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  Get.snackbar('Accepter Séance', "votre séance a été acceptée");
                                });
                              },
                              onRejectPressed: () {
                                controller.refuserSeance(seance.id);
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  Get.snackbar('Refuser Séance', "votre séance a été refusée");
                                });
                              },
                              status: seance.status,
                              monitorStatus: seance.moniteur_status,
                            ),
                          );
                        }).toList(),
                        ...controller.examens.map((examen) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: EventContainer(
                              date: '${examen.heureD}-${examen.heureF}',
                              title: "Examen " + examen.type,
                              subtitle: (examen.status == Status.awaiting)
                                  ? 'Vous pouvez choisir entre accepter et refuser.'
                                  : ' ',
                              showButtons: examen.status == Status.awaiting,
                              onAcceptPressed: () {
                                controller.acceptExamen(examen.id);
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  Get.snackbar('Accepter Examen', "votre examen a été accepté");
                                });
                              },
                              onRejectPressed: () {
                                controller.refuserExamen(examen.id);
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  Get.snackbar('Refuser Examen', "votre examen a été refusé");
                                });
                              },
                              status: examen.status,
                            ),
                          );
                        }).toList(),
                      ],
                    );
                  }
                }),
              ),
            ],
          );
        }
      }),
    );
  }
}
