import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final String title;
  final String image;
  final List<ProductModel> items;

  CategoriesModel({
    required this.title,
    required this.image,
    required this.items,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
