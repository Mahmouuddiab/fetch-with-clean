import 'package:clean/features/data/dataSource/CategoryRemoteDataSource.dart';
import 'package:clean/features/domain/entity/brand_entity.dart';
import 'package:clean/features/domain/entity/category_entity.dart';
import 'package:clean/features/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository{
  RemoteCategoryDataSource remoteCategoryDataSource;
  CategoryRepositoryImpl(this.remoteCategoryDataSource);
  @override
  Future<List<CategoryEntity>> getCategories()async{
    final models = await remoteCategoryDataSource.getCategories();
    return models.map((e) => CategoryEntity(id: e.id, name: e.name, image: e.image)).toList();
  }

  @override
  Future<List<BrandEntity>> getBrands()async{
    final model= await remoteCategoryDataSource.getBrands();
    return model.map((e)=>BrandEntity(id: e.id, name: e.name, image: e.image)).toList() ;
  }

}