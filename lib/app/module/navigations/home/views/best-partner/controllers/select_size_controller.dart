import 'package:get/get.dart';

class SelectSizeController extends GetxController{
  final RxInt currentIndex = 0.obs;

  void onSelect(int value) => currentIndex.value = value;
}