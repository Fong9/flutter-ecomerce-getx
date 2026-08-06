import 'package:get/state_manager.dart';

class CounterController extends GetxController{
  final RxInt number = 1.obs;

  void increment() => number.value++;

  void decrement() {
    if(number.value > 1) { 
      number.value--;
    }
  }
}