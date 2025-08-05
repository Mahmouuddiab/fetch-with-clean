import 'package:clean/features/domain/usecase/GetBrandsUseCase.dart';
import 'package:clean/features/domain/usecase/GetCategoriesUseCase.dart';
import 'package:clean/features/presentation/cubit/CategoryState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetBrandsUseCase getBrandsUseCase;

  CategoryCubit(this.getCategoriesUseCase,this.getBrandsUseCase) : super(CategoryInitial());

  void fetchCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await getCategoriesUseCase();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void fetchBrands() async {
    emit(BrandLoading());
    try {
      final brands = await getBrandsUseCase();
      emit(BrandLoaded(brands));
    } catch (e) {
      emit(BrandError(e.toString()));
    }
  }
}
