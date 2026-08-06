import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController{
  final pageController = PageController();
  final TokenStorage _tokenStorage;
  final RxInt currentIndex = 0.obs;

  OnboardingController({required TokenStorage tokenStorage}) : _tokenStorage = tokenStorage;

  void onChange(int index) => currentIndex.value = index;
  
  Future<void> finishOnboarding() async {
    await _tokenStorage.saveOnBoarding();

    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}