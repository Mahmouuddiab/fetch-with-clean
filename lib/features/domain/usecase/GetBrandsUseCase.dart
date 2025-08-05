import 'package:clean/features/domain/entity/brand_entity.dart';
import 'package:clean/features/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  final CategoryRepository repository;

  GetBrandsUseCase(this.repository);

  Future<List<BrandEntity>> call() => repository.getBrands();
}
