import 'package:flutter_application_1/app/module/navigations/home/controllers/best_partner_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/category_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/customer_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/controllers/subway_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/best-partner/best_partner_repo_imple.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/category/category_repo_imple.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/customer-review/customer_repo_imple.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/subway-brand/subway_repo_imple.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/controllers/counter_controller.dart';
import 'package:flutter_application_1/app/module/navigations/home/views/best-partner/controllers/select_size_controller.dart';
import 'package:flutter_application_1/app/module/navigations/profile/profile_controller.dart';
import 'package:flutter_application_1/app/module/navigations/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class NavbarBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());

    // home binding
    Get.lazyPut<CategoryRepoImple>(() => CategoryRepoImple());
    Get.lazyPut<CategoryController>(() => CategoryController(categoryRepo: Get.find<CategoryRepoImple>()));
    Get.lazyPut<BestPartnerRepoImple>(() => BestPartnerRepoImple());
    Get.lazyPut<BestPartnerController>(() => BestPartnerController(bestPartnerRepo: Get.find<BestPartnerRepoImple>()));

    // home_screen / subway_screen
    Get.lazyPut<SubwayRepoImple>(() => SubwayRepoImple());
    Get.lazyPut(() => SubwayController(subwayRepo: Get.find<SubwayRepoImple>()));

    // subway_screen / customer_review
    Get.lazyPut<CustomerRepoImple>(() => CustomerRepoImple());  
    Get.lazyPut<CustomerController>(() => CustomerController(customerRepo: CustomerRepoImple()));  
    
    // subway_screen / subway_detail
    Get.lazyPut<CounterController>(() => CounterController());  
    Get.lazyPut<SelectSizeController>(() => SelectSizeController());  

    // profile_screen
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}