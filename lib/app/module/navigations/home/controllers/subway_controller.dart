import 'dart:async';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/burger_combo_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/chicken_combo_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/subway_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/subway-brand/subway_repo_imple.dart';
import 'package:get/get.dart';

class SubwayController extends GetxController{
  final SubwayRepoImple subwayRepo;

  final RxBool isLoading = false.obs;

  SubwayController({required this.subwayRepo});

  final RxList<SubwayModel> _subwayModel = <SubwayModel>[].obs;
  final RxList<BurgerComboModel> _burgerCombo = <BurgerComboModel>[].obs;
  final RxList<ChickenComboModel> _chickenCombo = <ChickenComboModel>[].obs;

  RxList<SubwayModel> get subwayModel => _subwayModel;
  RxList<BurgerComboModel> get burgerCombo => _burgerCombo;
  RxList<ChickenComboModel> get chickenCombo => _chickenCombo;

  Future<void> fetchSubwayRepo() async {
    try {
      isLoading.value = true;

      await Future.delayed(Duration(milliseconds: 300));

      final res = await subwayRepo.getBurger();

      _subwayModel.assignAll(res);
    }finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBurgerCombo() async {
    try {
      isLoading.value = true;

      await Future.delayed(Duration(milliseconds: 300));
      final res = await subwayRepo.getBurgerCombo();

      _burgerCombo.assignAll(res);

    }finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchChickenCombo() async {
    try{
      isLoading.value = true;

      await Future.delayed(Duration(microseconds: 300));

      final res = await subwayRepo.getChickenCombo();

      _chickenCombo.assignAll(res);
    }finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchSubwayRepo();
    fetchBurgerCombo();
    fetchChickenCombo();
  }
}