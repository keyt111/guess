import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/views/timer_view.dart';

class M10Page extends BasePage {
  const M10Page({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _M10PageState();
}

class _M10PageState extends BasePageState<M10Page> {
  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: pop,
        ),
        title: Text(
          "快乐10分钟".tr,
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Row(
                children: [
                  Expanded(child: Text(
                    "No.07270001".tr,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),),
                  Expanded(child: Center(child: TimerView(
                    time: 180,
                    period: 20,
                    end: () {

                    },
                  ),)),
                ],
              ),
            ),
            // AnimatedBtn(
            //   onTap: () {
            //
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(5.w),
            //     ),
            //     alignment: Alignment.center,
            //     child: Text(
            //       '立即抽奖',
            //       style: TextStyle(
            //         fontSize: 14.sp,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
