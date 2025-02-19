import 'package:json_annotation/json_annotation.dart';
import 'package:user_github/module/domain/entity/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String? login;
  final int? id;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;

  const UserModel({
    this.login,
    this.id,
    this.avatarUrl,
    this.htmlUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() {
    return User(
      login: login,
      id: id,
      avatarUrl: avatarUrl,
      htmlUrl: htmlUrl,
    );
  }
}
