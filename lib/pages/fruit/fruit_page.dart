import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/fruit_info.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/providers/fruit_provider.dart';
import 'package:guess/utils/enum.dart';
import 'package:guess/utils/language.dart';

import 'view/betting_view.dart';
import 'view/record_view.dart';

class FruitPage extends BasePage {
  const FruitPage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _FruitPageState();
}

class _FruitPageState extends BasePageState<FruitPage> with TickerProviderStateMixin {
  ///奖品个数
  final int giftCount = 24;

  ///抽奖动画
  late Animation<int> animation;
  late AnimationController controller;

  List<FruitInfo> list = [
    FruitInfo(name: "🍉", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 2),
    FruitInfo(name: "🍎", multiplier: 1),
    FruitInfo(name: "🐯", multiplier: 10),
    FruitInfo(name: "⭐", multiplier: 1),
    FruitInfo(name: "🔔", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 1),
    FruitInfo(name: "🔔", multiplier: 3),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: "🍉", multiplier: 2),
    FruitInfo(name: "7⃣️", multiplier: 1),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: "🍎️", multiplier: 2),
    FruitInfo(name: "🍎", multiplier: 2),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: "7⃣️", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 1),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: "🍉", multiplier: 1),
    FruitInfo(name: "🍉", multiplier: 2),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: null),
    FruitInfo(name: "🍎", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 1),
    FruitInfo(name: "🔔", multiplier: 1),
    FruitInfo(name: "🍎", multiplier: 1),
    FruitInfo(name: "⭐", multiplier: 5),
    FruitInfo(name: "7⃣️", multiplier: 3),
    FruitInfo(name: "🍉", multiplier: 1),
    FruitInfo(name: "🍋", multiplier: 2),
  ];

  /// 初始值
  int end = 0;

  /// 抽奖状态
  GuessStatus guessStatus = GuessStatus.betting;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    );
    animation = StepTween(begin: 0, end: 24).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        setState(() {
          end = animation.value;
          guessStatus = GuessStatus.betting;
        });
        /// 完成更新中奖记录
        ref.read(fruitProvider).updateRecord(
          list[_animationIndex],
        );
      }
    });
  }

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: pop,
        ),
        title: Text(
          "水果老虎机".tr,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 280.w,
                    height: 280.w,
                    child: GridView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 1.w,
                        crossAxisSpacing: 1.w,
                        childAspectRatio: 1,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return _buildItem(list[index], index);
                      },
                    ),
                  ),
                  Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.wb_incandescent_outlined,
                      size: 130.w,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Row(
                    children: [
                      /// 记录
                      const RecordView(),
                      SizedBox(width: 5.w,),
                      /// 投注台
                      Expanded(child: BettingView(
                        onTap: _start,
                        enable: guessStatus == GuessStatus.betting,
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(FruitInfo item, int index) {
    if (item.name == null) {
      return const SizedBox();
    }
    return AnimatedBuilder(
      animation: animation,
      builder: (_, child) {
        Color color = Colors.grey.shade300;
        if (controller.status != AnimationStatus.dismissed) {
          color = _animationIndex == index
              ? Colors.orange
              : Colors.grey.shade300;
        }
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5.w),
              ),
              alignment: Alignment.center,
              child: Text(
                item.name!,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
            Offstage(
              offstage: item.multiplier == null || item.multiplier! < 2,
              child: Text(
                "x${item.multiplier!}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _start() {
    if (AnimationStatus.forward == controller.status) {
      return;
    }
    setState(() {
      guessStatus = GuessStatus.revealing;
    });
    int offset = 5 * giftCount + (Random.secure().nextInt(24));
    animation = StepTween(begin: end, end: end + offset).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
    controller.reset();
    controller.forward();
  }

  ///下标的转换
  int get _animationIndex {
    return [
      0, 1, 2, 3, 4, 5, 6,
      13, 20, 27, 34, 41, 48,
      47, 46, 45, 44, 43, 42,
      35, 28, 21, 14, 7][animation.value % giftCount];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

