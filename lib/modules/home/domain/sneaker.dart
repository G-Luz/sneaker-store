import 'package:json_annotation/json_annotation.dart';

part 'sneaker.g.dart';

@JsonSerializable()
class Sneaker {
  final int? id;
  final String name;
  final String imgUrl;
  final double price;
  final int? rating;

  Sneaker({
    this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    this.rating,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) =>
      _$SneakerFromJson(json);

  Map<String, dynamic> toJson() => _$SneakerToJson(this);
}
