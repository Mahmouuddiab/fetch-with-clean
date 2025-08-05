import 'package:clean/features/data/models/brand_model.dart';
import 'package:clean/features/data/models/category_model.dart';

abstract class RemoteCategoryDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<BrandModel>> getBrands();
}