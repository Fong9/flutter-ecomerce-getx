import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class NavbarController extends GetxController {
  final currentIndex = 0.obs;

  void onChange(int index) => currentIndex.value = index;

  @override
  void onInit() {
    super.onInit();

    if(Get.arguments != null) {
      currentIndex.value = Get.arguments['index'] ?? 0;
    }
  }
}