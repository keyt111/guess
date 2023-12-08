import 'package:shared_preferences/shared_preferences.dart';

/// 本地持久化存储工具类
class SpUtil {
  SpUtil._();

  static SharedPreferences? prefs;

  /// 初始化
  static Future<SharedPreferences?> init() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<bool?> setString(String key, String value) async {
    return prefs?.setString(key, value);
  }

  static Future<String?> getString(String key, {String? defValue}) async {
    return prefs?.getString(key) ?? defValue;
  }

  static Future<bool?> setInt(String key, int value) async {
    return prefs?.setInt(key, value);
  }

  static Future<int?> getInt(String key, {int? defValue}) async {
    return prefs?.getInt(key) ?? defValue;
  }

  static Future<bool?> setBool(String key, bool value) async {
    return prefs?.setBool(key, value);
  }

  static Future<bool?> getBool(String key, {bool? defValue}) async {
    return prefs?.getBool(key) ?? defValue;
  }

  static Future<bool?> setDouble(String key, double value) async {
    return prefs?.setDouble(key, value);
  }

  static Future<double?> getDouble(String key, {double? defValue}) async {
    return prefs?.getDouble(key) ?? defValue;
  }

  static Future<bool?> setStringList(String key, List<String> value) async {
    return prefs?.setStringList(key, value);
  }

  static Future<List<String>?> getStringList(String key, {List<String>? defValue}) async {
    return prefs?.getStringList(key) ?? defValue;
  }

  static Future<bool?> remove(String key) async {
    return prefs?.remove(key);
  }

  static Future<bool?> clear() async {
    return prefs?.clear();
  }
}