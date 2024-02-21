import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? title, description, image;
  int? price, productId;

  ProductModel({
    this.title,
    this.description,
    this.image,
    this.price,
    this.productId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
