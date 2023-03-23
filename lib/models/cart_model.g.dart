// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      img: json['img'] as String?,
      quantity: json['quantity'] as int?,
      isExists: json['isExists'] as bool?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'img': instance.img,
      'quantity': instance.quantity,
      'isExists': instance.isExists,
      'time': instance.time,
    };
