import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/burger_combo_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/chicken_combo_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/subway_model.dart';

abstract class SubwayRepo {
  Future<List<SubwayModel>> getBurger(); 
  Future<List<BurgerComboModel>> getBurgerCombo();
  Future<List<ChickenComboModel>> getChickenCombo();
}