import 'package:flutter_application_1/app/module/navigations/home/models/best_partner_model.dart';

abstract class BestPartnerRepo {
  Future<List<BestPartnerModel>> getBestPartner();
} 