import 'package:get/get.dart';
import '../repository/calendar_repo.dart';
import '../../models/seance_model.dart';
import '../../models/examen_model.dart';
import 'app_controller.dart';

class CalendarController extends GetxController {
  final CalendarRepo calendarRepo;
  final appController = Get.find<AppController>();

  var selectedDay = Rx<DateTime>(DateTime.now());
  var focusedDay = Rx<DateTime>(DateTime.now());
  var seances = <Seance>[].obs;
  var examens = <Examen>[].obs;
  var eventDays = <DateTime>[].obs;

  CalendarController({required this.calendarRepo});

  @override
  void onInit() {
    super.onInit();
    fetchEventDays();
    fetchSeancesForSelectedDay();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    fetchSeancesForSelectedDay();
  }

  void fetchSeancesForSelectedDay() async {
    seances.clear();
    examens.clear();
    final formattedDate = "${selectedDay.value.year}-${selectedDay.value.month}-${selectedDay.value.day}";
    final response = await calendarRepo.fetchSeancesForDate(formattedDate);
    final data = response.body;
    seances.value = (data['seances'] as List).map((e) => Seance.fromJson(e)).toList();
    examens.value = (data['examens'] as List).map((e) => Examen.fromJson(e)).toList();
  }

  void fetchEventDays() async {
    final response = await calendarRepo.fetchEvents();
    final data = response.body;

    List<DateTime> seanceDates = (data['seances'] as List).map((date) => DateTime.parse(date.toString())).toList();
    List<DateTime> examenDates = (data['examens'] as List).map((date) => DateTime.parse(date.toString())).toList();

    eventDays.value = [
      ...seanceDates,
      ...examenDates,
    ].toSet().toList();
  }

  Future acceptExamen(int examenId) async {
    final response = await calendarRepo.acceptExamen(examenId);
    if (response.statusCode == 200) {
      examens.firstWhere((element) => element.id == examenId).status = Status.accepted;
    } else {
      Get.snackbar('Erreur', 'Une erreur est survenue');
    }
    update();
  }

  Future refuserExamen(int examenId) async {
    final response = await calendarRepo.refuserExamen(examenId);
    if (response.statusCode == 200) {
      examens.firstWhere((element) => element.id == examenId).status = Status.refused;
    } else {
      Get.snackbar('Erreur', 'Une erreur est survenue');
    }
    update();
  }

  Future acceptSeance(int seanceId) async {
    final response = await calendarRepo.acceptSeance(seanceId);
    if (response.statusCode == 200) {
      if (appController.userRole == Roles.moniteur) {
        seances.firstWhere((element) => element.id == seanceId).moniteur_status = StatusMoniteur.accepted;
      } else {
        seances.firstWhere((element) => element.id == seanceId).candidat_status = StatusCandidat.accepted;
      }    } else {
      Get.snackbar('Erreur', 'Une erreur est survenue');
    }
    update();
  }

  Future refuserSeance(int seanceId) async {
    final response = await calendarRepo.RefuserSeance(seanceId);
    if (response.statusCode == 200) {
      if (appController.userRole == Roles.moniteur) {
        seances.firstWhere((element) => element.id == seanceId).moniteur_status = StatusMoniteur.accepted;
      } else {
        seances.firstWhere((element) => element.id == seanceId).candidat_status = StatusCandidat.accepted;
      }    } else {
      Get.snackbar('Erreur', 'Une erreur est survenue');
    }
    update();
  }

  Map<DateTime, List<dynamic> Function(DateTime)> buildEventMap() {
    Map<DateTime, List<dynamic> Function(DateTime)> eventMap = {};

    for (DateTime date in eventDays) {
      eventMap[date] = (DateTime day) => [day];
    }

    return eventMap;
  }
}
