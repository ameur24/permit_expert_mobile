import 'package:get/get.dart';
import 'package:test2/utils/utils.dart';
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
  var isLoading = false.obs; // Add loading state

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
    isLoading.value = true; // Start loading
    try {
      seances.clear();
      examens.clear();

      final formattedDate = "${selectedDay.value.year}-${selectedDay.value.month}-${selectedDay.value.day}";
      final response = await calendarRepo.fetchSeancesForDate(formattedDate);
      if (response.statusCode == 404) {
        print("une erreur est survenue");
        isLoading.value = false; // End loading
        return;
      }
      final data = response.body;
      seances.value = (data['seances'] as List?)?.map((e) => Seance.fromJson(e)).toList() ?? [];
      examens.value = (data['examens'] as List?)?.map((e) => Examen.fromJson(e)).toList() ?? [];
    } catch (e) {
      print('Error fetching seances and exams for selected day: $e');
      Get.snackbar('Error', 'An error occurred while fetching events for the selected date');
    } finally {
      isLoading.value = false; // End loading
    }
  }

  void fetchEventDays() async {
    isLoading.value = true; // Start loading
    try {
      final response = await calendarRepo.fetchEvents();
      final data = response.body;

      List<DateTime> seanceDates = (data['seances'] as List).map((date) => DateTime.parse(date.toString())).toList();
      List<DateTime> examenDates = (data['examens'] as List).map((date) => DateTime.parse(date.toString())).toList();

      eventDays.value = [
        ...seanceDates,
        ...examenDates,
      ].toSet().toList();
    } catch (e) {
      print('Error fetching event days: $e');
    } finally {
      isLoading.value = false; // End loading
    }
  }

  Future acceptExamen(int examenId) async {
    isLoading.value = true; // Start loading
    try {
      final response = await calendarRepo.acceptExamen(examenId);
      if (response.statusCode == 200) {
        final examen = examens.firstWhere((element) => element.id == examenId);
        examen.status = Status.accepted;
        update();
      } else {
        print("une erreur est survenue");
      }
    } catch (e) {
      print('Error accepting examen: $e');
    } finally {
      isLoading.value = false; // End loading
    }
  }

  Future refuserExamen(int examenId) async {
    isLoading.value = true; // Start loading
    try {
      final response = await calendarRepo.refuserExamen(examenId);
      if (response.statusCode == 200) {
        final examen = examens.firstWhere((element) => element.id == examenId);
        examen.status = Status.refused;
        update();
      } else {
        print("une erreur est survenue");
      }
    } catch (e) {
      print('Error refusing examen: $e');
    } finally {
      isLoading.value = false; // End loading
    }
  }

  Future acceptSeance(int seanceId) async {
    isLoading.value = true; // Start loading
    try {
      final response = await calendarRepo.acceptSeance(seanceId);
      if (response.statusCode == 200) {
        final seance = seances.firstWhere((element) => element.id == seanceId);
        if (userRole == Roles.moniteur) {
          seance.moniteur_status = Status.accepted;
        } else {
          seance.candidat_status = Status.accepted;
        }
        update();
      } else {
        print("une erreur est survenue");
      }
    } catch (e) {
      print('Error accepting seance: $e');
    } finally {
      isLoading.value = false; // End loading
    }
  }

  Future refuserSeance(int seanceId) async {
    isLoading.value = true; // Start loading
    try {
      final response = await calendarRepo.RefuserSeance(seanceId);
      if (response.statusCode == 200) {
        final seance = seances.firstWhere((element) => element.id == seanceId);
        if (userRole == Roles.moniteur) {
          seance.moniteur_status = Status.refused;
        } else {
          seance.candidat_status = Status.refused;
        }
        update();
      } else {
        print("une erreur est survenue");
      }
    } catch (e) {
      print('Error refusing seance: $e');
    } finally {
      isLoading.value = false; // End loading
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
