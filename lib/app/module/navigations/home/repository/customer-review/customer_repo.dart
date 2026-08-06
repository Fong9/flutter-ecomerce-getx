import 'package:flutter_application_1/app/module/navigations/home/models/customer-review/customer_model.dart';

abstract class CustomerRepo {
  Future<List<CustomerModel>> getCustomerReview();
}