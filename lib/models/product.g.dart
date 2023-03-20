// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['total_size'] as int,
      json['type_id'] as int,
      json['offset'] as int,
      (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'total_size': instance.total_size,
      'type_id': instance.type_id,
      'offset': instance.offset,
      'products': instance.products,
    };
