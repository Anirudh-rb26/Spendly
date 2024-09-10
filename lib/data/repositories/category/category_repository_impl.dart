import 'package:hive/hive.dart';
import 'package:spendly/data/models/category/category_model.dart';
import 'package:spendly/data/repositories/category/category_repostiory.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  static const String _boxName = 'categoriesBox';

  // Opening the HiveBox
  Future<Box<CategoryModel>> _getBox() async {
    return await Hive.openBox<CategoryModel>(_boxName);
  }

  @override
  Future<void> addCategory(CategoryModel category) async {
    final box = await _getBox();
    await box.add(category);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final box = await _getBox();
    return box.values.toList();
  }
}
