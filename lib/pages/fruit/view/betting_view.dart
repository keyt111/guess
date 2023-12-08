import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/betting_info.dart';
import 'package:guess/utils/enum.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/views/animated_btn.dart';

import 'betting_item_view.dart';

class BettingView extends ConsumerStatefulWidget {
  final Function() onTap;
  final bool enable;
  const BettingView({Key? key,
    required this.onTap,
    required this.enable,
  }) : super(key: key);

  @override
  ConsumerState<BettingView> createState() => _BettingViewState();
}

class _BettingViewState extends ConsumerState<BettingView> {
  /// 竞猜投注表
  List<BettingInfo> gList = [
    BettingInfo(obj: "🐯"),
    BettingInfo(obj: "⭐️"),
    BettingInfo(obj: "7⃣️"),
    BettingInfo(obj: "🔔"),
    BettingInfo(obj: "🍉"),
    BettingInfo(obj: "🍋"),
    BettingInfo(obj: "🍎"),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h),
          padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(5.w),
          ),
          child: Column(
            children: [
              Expanded(child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 20.w,
                    runSpacing: 10.h,
                    runAlignment: WrapAlignment.center,
                    children: [
                      ...gList.map((e) => BettingItemView(
                        width: 80.w,
                        guessType: GuessType.fruit,
                        bettingInfo: e,
                        enable: widget.enable,
                      )).toList(),
                    ],
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: 25.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "🪙10000",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                    AnimatedBtn(
                      onTap: widget.onTap,
                      enable: widget.enable,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: widget.enable ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '立即抽奖',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 60.w,
          color: Colors.white,
          child: Text(
            "投注台".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
