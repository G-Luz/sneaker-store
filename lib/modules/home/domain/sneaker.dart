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

  Sneaker copyWith({
    int? id,
    String? name,
    String? imgUrl,
    double? price,
    int? rating,
  }) {
    return Sneaker(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  factory Sneaker.fromJson(Map<String, dynamic> json) =>
      _$SneakerFromJson(json);

  Map<String, dynamic> toJson() => _$SneakerToJson(this);
}
