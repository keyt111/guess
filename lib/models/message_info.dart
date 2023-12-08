import 'package:json_annotation/json_annotation.dart';
part 'message_info.g.dart';

@JsonSerializable()
class MessageInfo {

  @JsonKey(name: "nickname")
  String? nickname;  /// 消息发送者昵称

  @JsonKey(name: "msg")
  String? msg;  /// 消息内容

  @JsonKey(name: "role")
  int? role;  /// 身份

  MessageInfo({
    this.nickname,
    this.msg,
    this.role,
  });

  factory MessageInfo.fromJson(Map<String,dynamic>srcJson) =>
      _$MessageInfoFromJson(srcJson);

  Map<String,dynamic> toJson() =>_$MessageInfoToJson(this);
}