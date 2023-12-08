import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess/models/user_info.dart';

/// 用户信息状态管理
final userProvider = ChangeNotifierProvider<UserChangeNotifier>(
      (ref) => UserChangeNotifier(),
);

/// 用户信息
class UserChangeNotifier extends ChangeNotifier {

  /// 用户信息
  UserInfo? _userInfo;
  UserInfo? get userInfo => _userInfo;

  /// 更新用户信息
  updateUserInfo(UserInfo? u) {
    _userInfo = u;
    notifyListeners();
  }

}