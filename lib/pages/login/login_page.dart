import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/config/constant.dart';
import 'package:guess/models/user_info.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/routers/my_routers.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/utils/sp_util.dart';
import 'package:guess/utils/toast.dart';
import 'package:crypto/crypto.dart';
import 'package:guess/utils/tool.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage> {

  FocusNode focusNode = FocusNode();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget buildChild(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: pop,
          ),
          title: Text(
            "登录".tr,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Icon(Icons.balance, color: Colors.blue, size: 120.w,),
              SizedBox(
                height: 30.h,
              ),
              _buildItem("账号", accountController),
              _buildItem("密码", passwordController),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRouters.register);
                },
                child: Text(
                  "没有账号？点此注册".tr,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: login,
                child: Container(
                  width: 240.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25.w),
                  ),
                  child: Text(
                    "登录".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(String title, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: Text(
              title.tr,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.sp,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: TextField(
                controller: controller,
                cursorColor: Colors.grey,
                maxLines: 1,
                maxLength: 20,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.sp,
                ),
                decoration: InputDecoration(
                  /// 去除右下角字符长度提示
                  counterText: "",
                  hintText: "请输入".tr,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() {
    String account = accountController.text.trim();
    String password = passwordController.text.trim();
    if(account.isEmpty || password.isEmpty) {
      Toast().toast(context, msg: "请输入账号或密码".tr);
      return;
    }
    /// 存储token
    String token = md5.convert(
        const Utf8Encoder().convert("$account-$password")
    ).toString();
    SpUtil.setString(Constant.token, token);

    /// 存储用户信息
    UserInfo userInfo = UserInfo(
      id: 1000001,
      nickname: "玩家一号",
      account: account,
      assets: 10000,
    );
    SpUtil.setString(Constant.userInfo, jsonEncode(userInfo));

    Navigator.pop(context);
  }
}
