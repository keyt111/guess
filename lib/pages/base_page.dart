import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess/providers/language_provider.dart';

abstract class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState createState() => getState();

  BasePageState getState();
}

abstract class BasePageState<T extends BasePage> extends ConsumerState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageProvider).language;
    return WillPopScope(
      child: buildChild(context),
      onWillPop: () async {
        return false;
      },
    );
  }

  Widget buildChild(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }

  /// 路由导航，rootNavigator 是否使用根节点下的 navigator。
  navigatorTo(Widget page, {bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  /// 路由导航，rootNavigator 是否使用根节点下的 navigator。
  navigatorTo2(Widget page, {bool rootNavigator = false}) {
    return Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
          return page;
        }),
        (route) => false,
    );
  }

  pop({Object? result}) {
    Navigator.pop(context, result);
  }

  /// 打开弹窗页面
  openDialog(Widget widget) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_){
        return widget;
      }
    );
  }
}