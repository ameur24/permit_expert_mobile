import 'package:get/get.dart';
import '../repository/calendar_repo.dart';
import '../../models/seance_model.dart';
import '../../models/examen_model.dart';

class CalendarController extends GetxController {
  final CalendarRepo calendarRepo;

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
    final formattedDate = "${selectedDay.value.year}-${selectedDay.value.month}-${selectedDay.value.day}";
    final response = await calendarRepo.fetchSeancesForDate(formattedDate);
    final data = response.body;
    seances.value = (data['seances'] as List).map((e) => Seance.fromJson(e)).toList();
    examens.value = (data['examens'] as List).map((e) => Examen.fromJson(e)).toList();
  }

  void fetchEventDays() async {
    final response = await calendarRepo.fetchEvents();
    final data = response.body;

    List<DateTime> seanceDates = (data['seances'] as List).map((date) => DateTime.parse(date as String)).toList();
    List<DateTime> examenDates = (data['examens'] as List).map((date) => DateTime.parse(date as String)).toList();

    eventDays.value = [
      ...seanceDates,
      ...examenDates,
    ].toSet().toList();
  }
  Future<String> acceptExamen(int examenId) async {
    try {
      final message = await calendarRepo.acceptExamen(examenId);
      return message;
    } catch (e) {
      throw Exception('Failed to accept examen: $e');
    }
  }
  void refuserExamen(int examenId) async {
    try {
      final message = await calendarRepo.refuserExamen(examenId);
      print(message);
    } catch (e) {
      print('Failed to refuse examen: $e');
    }
  }
  Future<String> acceptSeance(int seanceId) async {
    try {
      final message = await calendarRepo.acceptSeance(seanceId);
      return message;
    } catch (e) {
      throw Exception('Failed to accept seance: $e');
    }
  }
  Future<String> RefuserSeance(int seanceId) async {
    try {
      final message = await calendarRepo.acceptSeance(seanceId);
      return message;
    } catch (e) {
      throw Exception('Failed to refuse seance: $e');
    }
  }
  Map<DateTime, List<dynamic> Function(DateTime)> buildEventMap() {
    Map<DateTime, List<dynamic> Function(DateTime)> eventMap = {};

    for (DateTime date in eventDays) {
      eventMap[date] = (DateTime day) => [day];
    }

    return eventMap;
  }
}