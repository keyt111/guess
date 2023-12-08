// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as int?,
      nickname: json['nickname'] as String?,
      account: json['account'] as String?,
      assets: json['assets'] as int?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'account': instance.account,
      'assets': instance.assets,
    };
