import 'package:flutter_application_1/app/module/navigations/home/models/category_model.dart';
import 'package:flutter_application_1/app/module/navigations/home/repository/category/category_repo_imple.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  late CategoryRepoImple categoryRepo;

  CategoryController({required this.categoryRepo});

  final RxList<CategoryModel> _categories = <CategoryModel>[].obs;

  RxList<CategoryModel> get categories => _categories;

  Future<void> fetchCategory() async{
    final res = await categoryRepo.getCategory();

    _categories.assignAll(res);
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }
}