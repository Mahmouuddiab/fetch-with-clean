import 'package:clean/features/domain/entity/brand_entity.dart';
import 'package:clean/features/domain/entity/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<BrandEntity>> getBrands();
}
