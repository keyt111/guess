import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess/models/turntable_info.dart';
import 'package:guess/models/user_info.dart';

/// 俄罗斯转盘信息状态管理
final turntableProvider = ChangeNotifierProvider<TurntableChangeNotifier>(
      (ref) => TurntableChangeNotifier(),
);

/// 俄罗斯转盘信息
class TurntableChangeNotifier extends ChangeNotifier {

  /// 转盘中奖记录
  List<TurntableInfo> _record = [
    TurntableInfo(period: "07251605", number: "2", color: "orange"),
    TurntableInfo(period: "07251610", number: "13", color: "green"),
    TurntableInfo(period: "07251615", number: "6", color: "amber"),
    TurntableInfo(period: "07251620", number: "1", color: "green"),
    TurntableInfo(period: "07251625", number: "15", color: "orange"),
  ];
  List<TurntableInfo> get record => _record;

  /// 更新记录
  updateRecord(TurntableInfo info) {
    _record.insert(0, info);
    notifyListeners();
  }


}