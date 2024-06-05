import 'package:get/get.dart';
import '../../models/learn_model.dart';
import '../repository/learn_repo.dart';

class LearnController extends GetxController {
  final LearnRepo learnRepo;

  LearnController({required this.learnRepo});

  var isLoading = true.obs;
  var resources = <LearnModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    getResources();
    getResources1();
    super.onInit();
  }

  Future<void> getResources() async {
    try {
      isLoading(true);
      final response = await learnRepo.getResources();
      if (response.statusCode == 200) {
        List jsonResponse = response.body;
        var res = jsonResponse.map((data) => LearnModel.fromJson(data)).toList();
        resources.assignAll(res);
      } else {
        errorMessage('Failed to load resources');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }}

  Future<void> getResources1() async {
    try {
      isLoading(true);
      final response = await learnRepo.getResources();
      if (response.statusCode == 200) {
        List jsonResponse = response.body;
        var res = jsonResponse.map((data) => LearnModel.fromJson(data)).toList();
        resources.assignAll(res);
      } else {
        errorMessage('Failed to load resources');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }}
}
