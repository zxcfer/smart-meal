import 'package:json_annotation/json_annotation.dart';
import 'package:smart_meal/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(User user) => UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        photoUrl: user.photoUrl,
        createdAt: user.createdAt,
      );

  User toEntity() => User(
        id: id,
        name: name,
        email: email,
        photoUrl: photoUrl,
        createdAt: createdAt,
      );
}
