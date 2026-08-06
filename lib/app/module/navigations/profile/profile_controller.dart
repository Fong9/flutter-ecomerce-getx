import 'package:get/get.dart';

class ProfileController extends GetxController {

  RxBool notification = true.obs;
  RxBool promotionNotification = false.obs;

  RxBool isLoading = false.obs;

  void toggleNotification(bool value){
    notification.value = value;
  }


  void togglePromotion(bool value){
    promotionNotification.value = value;
  }


}