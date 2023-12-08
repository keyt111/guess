import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 骰子信息状态管理
final diceProvider = ChangeNotifierProvider<DiceChangeNotifier>(
      (ref) => DiceChangeNotifier(),
);

/// 骰子信息
class DiceChangeNotifier extends ChangeNotifier {

  int _roll = 1;
  int _sides = 1;

  int get roll => _roll;
  int get sides => _sides;

  void set roll(int value) {
    _roll = value;
    notifyListeners();
  }

  void set sides(int value) {
    _sides = value;
    notifyListeners();
  }

  // Logic Functions
  Future changeSides(int value) async {
    sides = value;
    notifyListeners();
    await rollDice();
  }

  Future rollDice() async {
    _delayedRoll(sides, 100);
    _delayedRoll(sides, 100);
    _delayedRoll(sides, 300);
    _delayedRoll(sides, 400);
    _delayedRoll(sides, 500);
  }

  void _delayedRoll(int sides, int delay) {
    Timer(Duration(milliseconds: delay), () {
      roll = Random().nextInt(sides) + 1;
      notifyListeners();
    });
  }

  void incrementDice() {
    int value = min(_roll + 1, _sides);
    roll = value;
    notifyListeners();
  }

  void decrementDice() {
    int value = max(roll - 1, 1);
    roll = value;
    notifyListeners();
  }
}