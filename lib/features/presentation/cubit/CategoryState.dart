

import 'package:clean/features/domain/entity/brand_entity.dart';
import 'package:clean/features/domain/entity/category_entity.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}


class CategoryLoading extends CategoryState {}
class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  CategoryLoaded(this.categories);
}
class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}

class BrandLoading extends CategoryState {}
class BrandLoaded extends CategoryState {
  final List<BrandEntity> brands;
  BrandLoaded(this.brands);
}
class BrandError extends CategoryState {
  final String message;

  BrandError(this.message);
}

