import 'package:flutter_application_1/app/module/navigations/home/models/customer-review/customer_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/customer-review/customer_repo.dart';

class CustomerRepoImple extends CustomerRepo{
  final now = DateTime.now();
  String get date => "${now.day}/${now.hour}/${now.minute}";
  @override
  Future<List<CustomerModel>> getCustomerReview() async {
    return [
      CustomerModel(
        prfile: "", 
        name: "Eleanor Summers",
        date: date, 
        comment: "What can I say it's fast food, it's Burger King.No different to any of the other burger kings, nice with adequate seating"
      ),
      CustomerModel(
        prfile: "", 
        name: "Victoria Champain",
        date: date, 
        comment: "Food, as always, is good both upstairs and downstairs is always clean (download the bk app for deals etc.) sit upstairs every time, more relaxed feel."
      ),
      CustomerModel(
        prfile: "", 
        name: "Laura Smith",
        date: date, 
        comment: "Amazing food. Lots of choice. We took a while to choose as everything sounded amazing on the menu! All cooked to perfection. Portions were large. Service excellent. Definitely plan to go again and often!"
      ),
      CustomerModel(
        prfile: "", 
        name: "Dora Perry",
        date: date, 
        comment: "I popped in for a late lunch on Friday after a long morning working. The staff member was rude and unhelpful and the toilets were closed. I will not be returning and suggest others do not either."
      ),
    ];
  }
}