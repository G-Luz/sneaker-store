// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sneaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sneaker _$SneakerFromJson(Map<String, dynamic> json) => Sneaker(
      id: json['id'] as int?,
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      price: (json['price'] as num).toDouble(),
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$SneakerToJson(Sneaker instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'price': instance.price,
      'rating': instance.rating,
    };
