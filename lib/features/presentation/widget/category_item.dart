import 'package:clean/features/data/models/category_model.dart';
import 'package:clean/features/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryEntity categoryEntity;
   CategoryItem({super.key,required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(categoryEntity.image),
        ),
        Text(categoryEntity.name)
      ],
    );
  }
}
