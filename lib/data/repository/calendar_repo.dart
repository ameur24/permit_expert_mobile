import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

import '../../models/seance_model.dart';

class CalendarRepo extends GetxService {
  final ApiClient apiClient;

  CalendarRepo({required this.apiClient});

  Future<Response> fetchSeancesForDate(String date) async {

    return await apiClient.getData('/api/seance/ShowSeanceForCandidat/$date');



  }
}
