import 'package:json_annotation/json_annotation.dart';
part 'betting_info.g.dart';

@JsonSerializable()
class BettingInfo {

  @JsonKey(name: "obj")
  String? obj;  /// 投注对象

  @JsonKey(name: "odds")
  int? odds;  /// 赔率

  @JsonKey(name: "betting")
  int? betting;  /// 投注数量

  BettingInfo({
    this.obj,
    this.odds,
    this.betting,
  });

  factory BettingInfo.fromJson(Map<String,dynamic>srcJson) =>
      _$BettingInfoFromJson(srcJson);

  Map<String,dynamic> toJson() =>_$BettingInfoToJson(this);
}