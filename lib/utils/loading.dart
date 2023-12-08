import 'package:flutter/material.dart';
import 'package:guess/config/constant.dart';
import 'package:guess/config/global.dart';
import 'package:guess/pages/dialog/loading_dialog.dart';
import 'package:guess/routers/my_routers.dart';
import 'package:guess/utils/sp_util.dart';

Set dict = {};
bool loadingStatus = false;
bool loginStatus = true;
bool errorStatus = true;
dynamic loading;
dynamic dialog;
bool networkStatus = false;
dynamic ctx;

class Loading {

  static Future<dynamic> before() {
    return showDialog(
      context: ctx,
      barrierColor: Colors.transparent,
      builder: (context) {
        return const LoadingDialog();
      },
    );
  }

  static void complete() {
    Navigator.pop(ctx);
  }

  /// 登陆失效
  static void login() {
    if(loginStatus) {
      loginStatus = false;
      Global.token = "";
      SpUtil.remove(Constant.token);
      Navigator.pushNamedAndRemoveUntil(ctx, MyRouters.logo, (route) => false);
      Future.delayed(const Duration(seconds: 3), () {
        loginStatus = true;
      });
    }
  }

  /// 显示加载loading
  static Future showLoading(context, {String? hit}) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return LoadingDialog(hit: hit);
      },
    );
  }

  /// 关闭加载loading
  static void hideLoading(context) {
    Navigator.pop(context);
  }

}