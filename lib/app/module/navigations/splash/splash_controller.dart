import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/module/auth/controllers/auth_controller.dart';
import 'package:flutter_application_1/app/routes/route.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final TokenStorage _tokenStorage;

  SplashController({required TokenStorage tokenStorage}) : _tokenStorage = tokenStorage;

  @override
  void onReady() {
    super.onReady();
    checkApp();
  }

  Future<void> checkApp() async {
    final firstTime = await _tokenStorage.firstLogged();

    if (firstTime) {
      Get.offAllNamed(Routes.onboarding);
      return;
    }

    final token = await _tokenStorage.getToken();
    print("TOKEN: $token");

    if (token == null) {
      // No login session
      Get.offAllNamed(Routes.login);
      return;
    }

      print("Found token, loading session");
      
    try {
      // Token exists, verify it
      await Get.find<AuthController>().loadSession();

      Get.offAllNamed(Routes.navbar);
    } catch (e) {
      // Token expired or invalid
      await _tokenStorage.deleteToken();

      Get.offAllNamed(Routes.login);
    }
  }
}
