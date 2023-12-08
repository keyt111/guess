import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/providers/fruit_provider.dart';
import 'package:guess/utils/language.dart';

class RecordView extends ConsumerStatefulWidget {
  const RecordView({Key? key}) : super(key: key);

  @override
  ConsumerState<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends ConsumerState<RecordView> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(fruitProvider).record;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 80.w,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...items.map((e) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 60.w,
                      height: 50.w,
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        e.name!,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Offstage(
                        offstage: items.indexOf(e) != 0,
                        child: Text(
                          "🆕".tr,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: e.multiplier == null || e.multiplier! < 2,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.h),
                        child: Text(
                          "x${e.multiplier!}",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )).toList(),
              ],
            ),
          ),
        ),
        Container(
          width: 60.w,
          color: Colors.white,
          child: Text(
            "记录".tr,
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

