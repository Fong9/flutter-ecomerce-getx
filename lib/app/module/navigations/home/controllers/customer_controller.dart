import 'package:flutter_application_1/app/module/navigations/home/models/customer-review/customer_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/customer-review/customer_repo_imple.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController{
  final CustomerRepoImple customerRepo;
  RxBool isLoading = false.obs;

  CustomerController({required this.customerRepo});

  final RxList<CustomerModel> _customerModel = <CustomerModel>[].obs;

  RxList<CustomerModel> get customerModel => _customerModel;

  Future<void> fetchCustomerReview() async {
    try{
      isLoading.value = true;

      await Future.delayed(Duration(milliseconds: 300));

      final res = await customerRepo.getCustomerReview();

      _customerModel.assignAll(res);

    }finally {
      isLoading.value = false;
    }
  }
  
  @override
  void onInit() {
    super.onInit();
    fetchCustomerReview();
  }
}