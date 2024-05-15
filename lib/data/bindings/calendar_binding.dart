import 'package:get/get.dart';
import '../controllers/calendar_controller.dart';
import '../repository/calendar_repo.dart';

class CalendarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CalendarRepo(apiClient: Get.find()));
    Get.put(CalendarController(calendarRepo: Get.find()));
  }
}
