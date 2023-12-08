import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/betting_info.dart';
import 'package:guess/models/turntable_info.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/providers/turntable_provider.dart';
import 'package:guess/utils/enum.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/utils/tool.dart';
import 'package:guess/views/betting_desk_view.dart';
import 'package:guess/views/timer_view.dart';

import 'message_view.dart';
import 'record_view.dart';
import 'view/pointer_view.dart';
import 'view/turntable_view.dart';

class TurntablePage extends BasePage {
  const TurntablePage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _TurntablePageState();
}

class _TurntablePageState extends BasePageState<TurntablePage> with TickerProviderStateMixin {
  /// 圆盘动画
  late AnimationController controller1;
  late Animation<double> animation1;
  double angle1 = 0.0;

  /// 指针动画
  late AnimationController controller2;
  late Animation<double> animation2;
  double angle2 = 0.0;

  /// 中奖数字和颜色
  int? an;
  String? ac;

  /// 竞猜状态
  GuessStatus guessStatus = GuessStatus.betting;

  /// 竞猜投注表
  List<BettingInfo> gList = [
    BettingInfo(obj: "蓝色", odds: 4),
    BettingInfo(obj: "橙色", odds: 4),
    BettingInfo(obj: "绿色", odds: 4),
    BettingInfo(obj: "黄色", odds: 4),
    BettingInfo(obj: "1", odds: 16),
    BettingInfo(obj: "2", odds: 16),
    BettingInfo(obj: "3", odds: 16),
    BettingInfo(obj: "4", odds: 16),
    BettingInfo(obj: "5", odds: 16),
    BettingInfo(obj: "6", odds: 16),
    BettingInfo(obj: "7", odds: 16),
    BettingInfo(obj: "8", odds: 16),
    BettingInfo(obj: "9", odds: 16),
    BettingInfo(obj: "10", odds: 16),
    BettingInfo(obj: "11", odds: 16),
    BettingInfo(obj: "12", odds: 16),
    BettingInfo(obj: "13", odds: 16),
    BettingInfo(obj: "14", odds: 16),
    BettingInfo(obj: "15", odds: 16),
    BettingInfo(obj: "16", odds: 16),
  ];

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    animation1 = Tween(begin: 0.0, end: 1.0).animate(controller1);
    controller1.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        setState(() {
          angle1 = animation1.value;
        });
      }
    });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    );
    animation2 = Tween(begin: 0.0, end: 1.0).animate(controller2);
    controller2.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        setState(() {
          angle2 = animation2.value;
        });
        /// 完成后计算 转盘和指针的夹角
        /// 两个旋转之和 /（2*pi）得到圈数
        /// 去除整圈，乘以总等分16，得到非整数圈的等分
        /// 然后用总等分16减去非整数圈的等分，得到夹角所对应的等分，
        /// 向上取整得到该等分所在的数字和颜色
        int d = (16 - ((((angle1 + angle2) / (2*pi)) - (angle1 + angle2) ~/ (2*pi)) * 16)).ceil();
        setState(() {
          an = d;
          ac = d % 4 == 0 ? "blue" : d % 4 == 1
              ? "green" : d % 4 == 2
              ? "amber" : "orange";
          guessStatus = GuessStatus.betting;
        });
        ref.read(turntableProvider).updateRecord(
          TurntableInfo(period: "07251605", number: "$an", color: "$ac"),
        );
      }
    });
  }

  /// 开始抽奖
  void startAnimation() {
    double offset1 = 10 * 2 * pi * (Random.secure().nextDouble() + 1);
    animation1 = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: angle1, end: angle1 + offset1*0.4).chain(CurveTween(curve: Curves.easeInQuad)),
        weight: 0.4,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: angle1 + offset1*0.4, end: angle1 + offset1*0.6).chain(CurveTween(curve: Curves.linear)),
        weight: 0.2,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: angle1 + offset1*0.6, end: angle1 + offset1).chain(CurveTween(curve: Curves.easeOutQuad)),
        weight: 0.4,
      ),
    ]).animate(controller1);
    controller1.reset();
    controller1.forward();

    double offset2 = 5 * 2 * pi * (Random.secure().nextDouble() + 1);
    animation2 = Tween(begin: angle2, end: angle2 + offset2).animate(
      CurvedAnimation(parent: controller2, curve: Curves.easeInOut),
    );
    controller2.reset();
    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
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
            "俄罗斯转盘".tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {

              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
                child: Text(
                  "统计".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 1.h,
                left: 0,
                right: 0,
                child: Center(
                  child: TimerView(
                    time: 180,
                    period: 20,
                    end: () {
                      setState(() {
                        guessStatus = GuessStatus.revealing;
                      });
                      startAnimation();
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                    child: Row(
                      children: [
                        Text(
                          "No.072530",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.sp,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 16.h,
                          child: Text(
                            guessStatus == GuessStatus.betting ? "投注中" : "开奖中",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      /// 转盘
                      AnimatedBuilder(
                          animation: controller1,
                          child: const TurntableView(),
                          builder: (_, child) {
                            return Transform.rotate(
                              angle: animation1.value,
                              child: child,
                            );
                          }
                      ),
                      /// 指针 与圆盘反方向旋转
                      AnimatedBuilder(
                          animation: controller2,
                          child: const PointerView(),
                          builder: (_, child) {
                            return Transform.rotate(
                              angle: -animation2.value,
                              child: child,
                            );
                          }
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  const RecordView(),
                  SizedBox(height: 1.h,),
                  const Divider(),
                  const MessageView(),
                ],
              ),
              /// 投注台
              Positioned(
                right: 10.w,
                bottom: 10.h,
                child: BettingDeskView(
                  gList: gList,
                  guessType: GuessType.turntable,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
