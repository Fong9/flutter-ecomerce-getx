import 'package:flutter_application_1/app/module/navigations/home/models/best_partner_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/best-partner/best_partner_repo_imple.dart';
import 'package:get/get.dart';

class BestPartnerController extends GetxController{
  late BestPartnerRepoImple bestPartnerRepo;

  BestPartnerController({required this.bestPartnerRepo});

  final RxList<BestPartnerModel> _bestPartner = <BestPartnerModel>[].obs;

  RxList<BestPartnerModel> get bestPartner => _bestPartner;

  Future<void> fetchBestPartner() async {
    final res = await bestPartnerRepo.getBestPartner();

    _bestPartner.assignAll(res);
  }

  @override
  void onInit() {
    super.onInit();
    fetchBestPartner();
  }
}
