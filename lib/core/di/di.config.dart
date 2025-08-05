// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/data/dataSource/CategoryRemoteDataSource.dart' as _i762;
import '../../features/data/dataSource/RemoteCategoryDataSourceImpl.dart'
    as _i26;
import '../../features/data/repository/CategoryRepositoryImpl.dart' as _i749;
import '../../features/domain/repository/category_repository.dart' as _i992;
import '../../features/domain/usecase/GetBrandsUseCase.dart' as _i937;
import '../../features/domain/usecase/GetCategoriesUseCase.dart' as _i612;
import '../../features/presentation/cubit/CategoryCubit.dart' as _i503;
import '../api/dio_helper.dart' as _i646;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i646.DioHelper>(() => _i646.DioHelper.new());
    gh.factory<_i762.RemoteCategoryDataSource>(
      () => _i26.RemoteCategoryDataSourceImpl(),
    );
    gh.factory<_i992.CategoryRepository>(
      () => _i749.CategoryRepositoryImpl(gh<_i762.RemoteCategoryDataSource>()),
    );
    gh.factory<_i612.GetCategoriesUseCase>(
      () => _i612.GetCategoriesUseCase(gh<_i992.CategoryRepository>()),
    );
    gh.factory<_i937.GetBrandsUseCase>(
      () => _i937.GetBrandsUseCase(gh<_i992.CategoryRepository>()),
    );
    gh.factory<_i503.CategoryCubit>(
      () => _i503.CategoryCubit(
        gh<_i612.GetCategoriesUseCase>(),
        gh<_i937.GetBrandsUseCase>(),
      ),
    );
    return this;
  }
}
