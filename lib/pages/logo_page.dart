import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/config/constant.dart';
import 'package:guess/config/global.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/routers/my_routers.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/utils/sp_util.dart';
import 'package:guess/views/animated_text.dart';

import '../utils/loading.dart';

class LogoPage extends BasePage {
  const LogoPage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _LogoPageState();
}

class _LogoPageState extends BasePageState<LogoPage> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init();
    });
  }

  /// 初始化基础数据
  Future<void> _init() async {
    /// 读取token信息，没有token需要登陆
    final token = await SpUtil.getString(Constant.token);
    if(token != null && token != "") {
      Global.token = token;
      _initRole();
    } else {
      if(mounted) {
        await Navigator.pushNamed(context, MyRouters.login);
        _init();
      }
    }
  }

  /// 加载玩家信息
  Future<void> _initRole() async {
    final result = await SpUtil.getString(Constant.userInfo);
    if(result != null) {
      /// 进入首页
      if(mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MyRouters.home,
              (route) => false,
        );
      }
    } else {
      if(mounted) {
        await Navigator.pushNamed(context, MyRouters.login);
        _init();
      }
    }
  }

  @override
  Widget buildChild(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 60.w,
                height: 60.w,
                child: const CircularProgressIndicator(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "资源加载中".tr,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.sp,
                    ),
                  ),
                  const AnimatedText(
                    text: "...",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 监听程序进入前后台的状态改变的方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed: // 前台可见
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused: // 后台不可见
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeDependencies() {
    ctx = context;
    super.didChangeDependencies();
  }
}
