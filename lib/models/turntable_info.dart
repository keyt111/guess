import 'package:json_annotation/json_annotation.dart';
part 'turntable_info.g.dart';

@JsonSerializable()
class TurntableInfo {

  @JsonKey(name: "period")
  String? period;  /// 期数

  @JsonKey(name: "number")
  String? number;  /// 开奖号码

  @JsonKey(name: "color")
  String? color;  /// 开奖颜色

  TurntableInfo({
    this.period,
    this.number,
    this.color,
  });

  factory TurntableInfo.fromJson(Map<String,dynamic>srcJson) =>
      _$TurntableInfoFromJson(srcJson);

  Map<String,dynamic> toJson() =>_$TurntableInfoToJson(this);
}