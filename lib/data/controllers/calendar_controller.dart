import 'package:get/get.dart';
import '../repository/calendar_repo.dart';
import '../../models/seance_model.dart';

class CalendarController extends GetxController {
  final CalendarRepo calendarRepo;

  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var seances = <Seance>[].obs;

  CalendarController({required this.calendarRepo});

  @override
  void onInit() {
    super.onInit();
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
    final List<dynamic> jsonList = response.body;
    seances.value =   jsonList.map((e) => Seance.fromJson(e)).toList();
print(seances.value);
  }
}
