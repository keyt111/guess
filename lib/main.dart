import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/providers/language_provider.dart';
import 'package:guess/routers/my_routers.dart';
import 'package:guess/utils/sp_util.dart';

Future<void> main() async {
  /// 确保flutter启动成功
  WidgetsFlutterBinding.ensureInitialized();
  ///设置竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft
  ]);
  /// 全面屏
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  /// 初始化本地存储
  await SpUtil.init();

  runApp(const ProviderScope(
    child: MyApp(),
  ));

}

class MyApp extends BasePage {
  const MyApp({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _MyAppState();
}

class _MyAppState extends BasePageState<MyApp> {
  @override
  Widget buildChild(BuildContext context) {
    return ScreenUtilInit(
      /// 设计稿尺寸px
      designSize: const Size(320, 480),
      builder: (context , child) {
        return MaterialApp(
          /// 去掉debug标识
          debugShowCheckedModeBanner: false,
          initialRoute: MyRouters.logo,
          routes: MyRouters.routes,
          color: Colors.white,
          localeResolutionCallback: (locale, _) {
            if(locale?.languageCode != null && locale!.languageCode.isNotEmpty) {
              Future.delayed(const Duration(milliseconds: 300), () {
                ref.read(languageProvider).setLanguage(locale.languageCode);
              });
            }
            return null;
          },
          theme: ThemeData(
            fontFamily: "方正粗圆繁体",
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
        );
      },
    );
  }
}

