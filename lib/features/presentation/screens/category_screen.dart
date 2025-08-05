import 'package:clean/core/di/di.dart';
import 'package:clean/features/presentation/cubit/CategoryCubit.dart';
import 'package:clean/features/presentation/cubit/CategoryState.dart';
import 'package:clean/features/presentation/widget/brand_item.dart';
import 'package:clean/features/presentation/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  CategoryCubit categoryCubit = getIt<CategoryCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc:
          categoryCubit
            ..fetchCategories()
            ..fetchBrands(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Categories")),
          body: Column(
            spacing: 12,
            children: [
              ImageSlideshow(
                width: double.infinity,
                height: 200,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset("assets/CarouselSlider1.png"),
                  Image.asset("assets/CarouselSlider2.png"),
                  Image.asset("assets/CarouselSlider3.png"),
                ],
              ),
              SizedBox(height: 20),
              state is CategoryLoaded
                  ? SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return CategoryItem(categoryEntity: category);
                      },
                    ),
                  )
                  : CircularProgressIndicator(),
              SizedBox(height: 25),
              state is BrandLoaded
                  ? SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.brands.length,
                      itemBuilder: (context, index) {
                        final brand = state.brands[index];
                        return BrandItem(brandEntity: brand);
                      },
                    ),
                  )
                  : CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
