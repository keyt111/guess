// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) => MessageInfo(
      nickname: json['nickname'] as String?,
      msg: json['msg'] as String?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
      'msg': instance.msg,
      'role': instance.role,
    };
