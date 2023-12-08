import 'package:json_annotation/json_annotation.dart';
part 'fruit_info.g.dart';

@JsonSerializable()
class FruitInfo {

  @JsonKey(name: "period")
  String? period;  /// 期数

  @JsonKey(name: "id")
  int? id;  /// 号码ID

  @JsonKey(name: "name")
  String? name;  /// 号码名称

  @JsonKey(name: "multiplier")
  int? multiplier;  /// 号码奖励倍率

  FruitInfo({
    this.period,
    this.id,
    this.name,
    this.multiplier,
  });

  factory FruitInfo.fromJson(Map<String,dynamic>srcJson) =>
      _$FruitInfoFromJson(srcJson);

  Map<String,dynamic> toJson() =>_$FruitInfoToJson(this);
}