import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../repository/edit_repo.dart';

class EditProfileController extends GetxController {
  final EditProfileRepo editProfileRepo;

  EditProfileController({required this.editProfileRepo});

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController dateNaissanceController = TextEditingController();
  final TextEditingController numTelController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final Rx<File?> image = Rx<File?>(null);
  final RxBool isLoading = RxBool(false);
  final RxList<String> languageOptions = ['Français', 'Arabe', 'Anglais'].obs;
  final RxString selectedLanguage = 'Français'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    isLoading.value = true;
    try {
      final response = await editProfileRepo.getUserProfile();

      if (response.statusCode == 200) {
        final data = response.body;
        userNameController.text = data['user_name'];
        dateNaissanceController.text = data['dateNaissance'];
        numTelController.text = data['numTel'];
        emailController.text = data['email'];
        if (data['user_image'] != null && data['user_image'].isNotEmpty) {
          image.value = File(data['user_image']);
        }
      } else {
        Get.snackbar('Erreur', 'Échec de la récupération du profil');
      }
    } catch (e) {
      Get.snackbar('Erreur', 'Une erreur est survenue');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> updateProfile() async {
    final userName = userNameController.text.trim();
    final dateNaissance = dateNaissanceController.text.trim();
    final numTel = numTelController.text.trim();
    final email = emailController.text.trim();
    final userImage = image.value?.path ?? '';

    if (dateNaissance.isEmpty) {
      Get.snackbar('Erreur', 'La date de naissance ne peut pas être vide.');
      return;
    }

    isLoading.value = true;

    try {
      final response = await editProfileRepo.updateProfile(
        userImage: userImage,
        userName: userName,
        dateNaissance: dateNaissance,
        numTel: numTel,
        email: email,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Succès', response.body['message']);
        Get.back();
      } else {
        print('Server error: ${response.statusCode}');
        print('Server response: ${response.body}');
        Get.snackbar('Erreur', 'Échec de la mise à jour du profil');
      }
    } catch (e) {
      Get.snackbar('Erreur', 'Une erreur est survenue lors de la mise à jour du profil');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    userNameController.dispose();
    dateNaissanceController.dispose();
    numTelController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
