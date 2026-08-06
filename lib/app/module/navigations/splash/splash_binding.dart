import 'package:flutter_application_1/app/core/storage/token_storage.dart';
import 'package:flutter_application_1/app/module/navigations/splash/splash_controller.dart';
import 'package:get/instance_manager.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(tokenStorage: Get.find<TokenStorage>()));
  }
}