import 'package:flutter_application_1/app/core/themes/image.dart';
import 'package:flutter_application_1/app/module/navigations/home/models/category_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/category/category_repo.dart';
import 'package:flutter_application_1/app/routes/route.dart';

class CategoryRepoImple extends CategoryRepo{
  @override
  Future<List<CategoryModel>> getCategory() async{
    return [
      CategoryModel(
        img: Images.sandwich, 
        name: "Sandwich",
        route: Routes.sandwich
      ),
      CategoryModel(
        img: Images.pizza, 
        name: "Pizza",
        route: Routes.pizza
      ),
      CategoryModel(
        img: Images.burger, 
        name: "Burgers",
        route: Routes.burger
      ),
    ];
  }
}