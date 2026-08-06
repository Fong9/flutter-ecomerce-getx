import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/module/navigations/on-boarding/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController(tokenStorage: Get.find<TokenStorage>()));
  }
}