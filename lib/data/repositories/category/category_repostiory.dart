import 'package:spendly/data/models/category/category_model.dart';

abstract class CategoryRepository {
  Future<void> addCategory(CategoryModel category);
  Future<List<CategoryModel>> getCategories();
}
