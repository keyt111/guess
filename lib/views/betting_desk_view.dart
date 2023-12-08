import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/betting_info.dart';
import 'package:guess/utils/enum.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/views/betting_item_view.dart';

class BettingDeskView extends ConsumerStatefulWidget {
  final GuessType guessType;  /// 活动类型
  final List<BettingInfo> gList; /// 投注对象列表

  const BettingDeskView({
    Key? key,
    required this.guessType,
    required this.gList,
  }) : super(key: key);

  @override
  ConsumerState<BettingDeskView> createState() => _BettingDeskViewState();
}

class _BettingDeskViewState extends ConsumerState<BettingDeskView> with TickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation1;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation1 = Tween(begin: 0.0, end: 1.0).animate(controller);
    animation2 = Tween(begin: 1.0, end: 0.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ScaleTransition(
          scale: animation1,
          alignment: Alignment.centerRight,
          child: Opacity(
            opacity: animation1.value,
            child: Container(
              width: 300.w,
              height: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(-5, 5),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(5, -5),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40.w,
                      ),
                      Text(
                        "投注器".tr,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                        child: GestureDetector(
                          onTap: () {
                            controller.reverse();
                          },
                          child: Icon(Icons.clear, color: Colors.grey, size: 20.w,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Expanded(child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Wrap(
                        runSpacing: 8.h,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          ...widget.gList.map((e) => BettingItemView(
                            width: (320.w - 28.w)/3,
                            guessType: widget.guessType,
                            bettingInfo: e,
                          )).toList(),
                        ],
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: Row(
                      children: [
                        Expanded(child: Container(
                          height: 20.h,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5.w),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "🪙10000",
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                          onTap: () {
                            /// 投注
                          },
                          child: Container(
                            width: 80.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "投注".tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ScaleTransition(
          scale: animation2,
          alignment: Alignment.centerRight,
          child: Opacity(
            opacity: animation2.value,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.forward();
              },
              child: Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.shade200,
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.blueAccent.shade200,
                      offset: const Offset(0, -2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  "投注器".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
