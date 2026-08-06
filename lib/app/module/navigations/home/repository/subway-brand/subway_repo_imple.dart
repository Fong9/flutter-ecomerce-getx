import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/burger_combo_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/chicken_combo_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/subway-model/subway_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/subway-brand/subway_repo.dart';

class SubwayRepoImple extends SubwayRepo{

  @override
  Future<List<SubwayModel>> getBurger() async {
    return [
      SubwayModel(
        name: "Extreme cheese whopper JR", 
        price: 5.99, 
        type: "Burger",
        img: "https://png.pngtree.com/png-clipart/20240830/original/pngtree-burger-with-floating-ingredient-png-image_15881303.png"
      ),
      SubwayModel(
        name: "Beef cheese bacon burger", 
        price: 6.99, 
        type: "Burger",
        img: "https://static.vecteezy.com/system/resources/previews/048/093/831/non_2x/close-up-fresh-beef-burger-isolated-on-transparent-background-png.png"
      ),
      SubwayModel(
        name: "Singles BBQ bacon cheese burger", 
        price: 7.99, 
        type: "Burger",
        img: "https://png.pngtree.com/png-clipart/20250510/original/pngtree-burger-png-image_19773597.png"
      ),
      SubwayModel(
        name: "Potato chip cheese burger", 
        price: 3.99, 
        type: "Burger",
        img: "https://static.vecteezy.com/system/resources/thumbnails/067/905/314/small/juicy-beef-burger-with-cheese-lettuce-tomato-and-onion-on-a-sesame-seed-bun-png.png"
      ),
    ];
  }

  @override
  Future<List<BurgerComboModel>> getBurgerCombo() async {
    return [
      BurgerComboModel(
        name: "Combo Spicy Tender", 
        price: 10.15, 
        type: "Burger combo", 
        img: "https://png.pngtree.com/png-clipart/20240825/original/pngtree-delicious-burger-and-fries-combo-ultimate-fast-food-feast-isolated-with-png-image_15849961.png"
      ),
      BurgerComboModel(
        name: "Combo Tender Grill Combo", 
        price: 12.15, 
        type: "Burger combo", 
        img: "https://static.vecteezy.com/system/resources/previews/069/564/591/non_2x/delicious-fast-food-combo-with-burger-fries-and-fried-chicken-png.png"
      ),
      BurgerComboModel(
        name: "Combo BBQ Bacon Tender", 
        price: 8.15, 
        type: "Burger combo", 
        img: "https://png.pngtree.com/png-vector/20240716/ourmid/pngtree-fast-food-combo-meal--burgers-fries-and-more-png-image_13082439.png"
      ),
    ];
  }

  @override
  Future<List<ChickenComboModel>> getChickenCombo() async {
    return [
      ChickenComboModel(
        name: "Chicken BBQ", 
        price: 5.67, 
        type: "Chicken combo", 
        img: "https://static.vecteezy.com/system/resources/thumbnails/024/724/510/small/hot-and-crispy-fried-chicken-isolated-on-transparent-background-fresh-pieces-of-crispy-fried-chicken-fast-food-generative-ai-png.png"
      ),
      ChickenComboModel(
        name: "Combo Chicken Crispy Bacon", 
        price: 5.67, 
        type: "Chicken combo", 
        img: "https://png.pngtree.com/png-clipart/20250421/original/pngtree-crispy-fried-chicken-and-fries-meal-png-image_20753695.png"
      ),
      ChickenComboModel(
        name: "Combo BBQ Bacon Tender", 
        price: 5.67, 
        type: "Chicken combo", 
        img: "https://png.pngtree.com/png-vector/20240518/ourmid/pngtree-a-chicken-and-french-fries-are-on-white-background-png-image_12489301.png"
      ),
    ];
  }
}