import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String name;
  final String email;
  final int? age;
  final bool isAdmin;
  final String? password;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    this.age,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
