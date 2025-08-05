import 'package:clean/features/domain/entity/category_entity.dart';
import 'package:clean/features/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call() => repository.getCategories();
}
