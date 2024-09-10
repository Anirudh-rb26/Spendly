import 'package:spendly/data/models/category/category_model.dart';
import 'package:spendly/data/repositories/category/category_repostiory.dart';

class AddCategory {
  final CategoryRepository repository;

  AddCategory(this.repository);

  Future<void> call(CategoryModel category) {
    return repository.addCategory(category);
  }
}

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryModel>> call() {
    return repository.getCategories();
  }
}
