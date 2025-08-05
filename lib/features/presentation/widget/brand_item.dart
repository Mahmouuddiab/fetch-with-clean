import 'package:clean/features/data/models/category_model.dart';
import 'package:clean/features/domain/entity/brand_entity.dart';
import 'package:clean/features/domain/entity/category_entity.dart';
import 'package:flutter/material.dart';

class BrandItem extends StatelessWidget {
  BrandEntity brandEntity;
  BrandItem({super.key,required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(brandEntity.image),
        ),
        Text(brandEntity.name)
      ],
    );
  }
}
