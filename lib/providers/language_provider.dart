import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess/utils/language.dart';

/// 语言信息状态管理
final languageProvider = ChangeNotifierProvider<LanguageChangeNotifier>(
      (ref) => LanguageChangeNotifier(),
);

/// 语言信息
class LanguageChangeNotifier extends ChangeNotifier {

  String _language = Language.language;
  String get language => _language;

  /// 设置语言
  setLanguage(String s) {
    Language.language = s;
    _language = s;
    notifyListeners();
  }
}