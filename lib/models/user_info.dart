import 'package:json_annotation/json_annotation.dart';
part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {

  @JsonKey(name: "id")
  int? id;  /// 用户userID

  @JsonKey(name: "nickname")
  String? nickname;  /// 用户昵称

  @JsonKey(name: "account")
  String? account;  /// 用户登录账号

  @JsonKey(name: "assets")
  int? assets;  /// 用户资产

  UserInfo({
    this.id,
    this.nickname,
    this.account,
    this.assets,
  });

  factory UserInfo.fromJson(Map<String,dynamic>srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String,dynamic> toJson() =>_$UserInfoToJson(this);
}