import 'dart:convert';

import 'package:clean/core/api/dio_helper.dart';
import 'package:clean/features/data/dataSource/CategoryRemoteDataSource.dart';
import 'package:clean/features/data/models/brand_model.dart';
import 'package:clean/features/data/models/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteCategoryDataSource)
class RemoteCategoryDataSourceImpl implements RemoteCategoryDataSource{
  @override
  Future<List<CategoryModel>> getCategories()async{
    final response = await DioHelper.getData(url: "https://ecommerce.routemisr.com/api/v1/categories");
    if(response.statusCode==200){
      final List data=response.data['data'];
      return data.map((json)=>CategoryModel.fromJson(json)).toList() ;
    }
    else{
      throw Exception(response.data);
    }
  }

  @override
  Future<List<BrandModel>> getBrands()async{
    final response= await DioHelper.getData(url: "https://ecommerce.routemisr.com/api/v1/brands");
    if(response.statusCode==200){
      final List data = response.data['data'];
      return data.map((json)=>BrandModel.fromJson(json)).toList() ;
    }
    else{
      throw Exception(response.data);
    }
  }

}