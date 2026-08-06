import 'package:flutter_application_1/app/module/navigations/home/models/category_model.dart';

abstract class CategoryRepo {
  Future<List<CategoryModel>> getCategory();
}