import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String title;

  final String description;

  final String image;
  final double price;
  final int discountValue;
  final int productId;

  ProductModel({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.productId,
    required this.discountValue  ,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
