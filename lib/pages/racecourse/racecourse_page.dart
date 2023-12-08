import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/utils/language.dart';

class RacecoursePage extends BasePage {
  const RacecoursePage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _RacecoursePageState();
}

class _RacecoursePageState extends BasePageState<RacecoursePage> {
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
          "跑马场".tr,
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
        child: Container(),
      ),
    );
  }
}


