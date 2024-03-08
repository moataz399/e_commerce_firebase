// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: json['price'] as num,
      productId: json['product_id'] as int,
      discountValue: json['discount_value'] as int,
      inFav: json['inFav'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'discount_value': instance.discountValue,
      'product_id': instance.productId,
      'inFav': instance.inFav,
    };
