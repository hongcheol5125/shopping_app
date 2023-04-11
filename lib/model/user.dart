import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String password;
  String type;

  User({required this.id, required this.password, required this.type});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class UserType {
  static String celler = "운영자";
  static String buyer = "구매자";
}
