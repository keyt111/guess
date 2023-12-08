import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess/models/fruit_info.dart';
import 'package:guess/models/turntable_info.dart';
import 'package:guess/models/user_info.dart';

/// 水果老虎机信息状态管理
final fruitProvider = ChangeNotifierProvider<FruitChangeNotifier>(
      (ref) => FruitChangeNotifier(),
);

/// 水果老虎机信息
class FruitChangeNotifier extends ChangeNotifier {

  /// 中奖记录
  List<FruitInfo> _record = [
    FruitInfo(name: "🍉", multiplier: 2),
    FruitInfo(name: "🍎", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 1),
    FruitInfo(name: "🍉", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 2),
  ];
  List<FruitInfo> get record => _record;

  /// 更新记录
  updateRecord(FruitInfo info) {
    _record.insert(0, info);
    notifyListeners();
  }


}