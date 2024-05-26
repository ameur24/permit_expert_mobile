import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/message_repo.dart';

class MessageController extends GetxController {
  final MessageRepo messageRepo;
  final TextEditingController messageController = TextEditingController();

  MessageController({required this.messageRepo});

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  Future<void> postMessage(String message) async {
    try {
      final response = await messageRepo.postMessage(message);
      if (response.statusCode == 200) {

        Get.back();
      }

    } catch (e) {

      print('Erreur lors de l\'envoi du message: $e');
    }
  }
}
