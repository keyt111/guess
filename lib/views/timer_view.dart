import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/tool.dart';

class TimerView extends StatefulWidget {
  final int time; /// 定时器时长
  final int period; /// 间隔时长
  final Function() end; /// 定时器结束回调

  const TimerView({Key? key,
    required this.time,
    required this.end,
    required this.period,
  }) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  /// 计时器
  Timer? timer;
  /// 定时器时长
  int time = 0;
  /// 间隔时长
  int period = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// 开始倒计时
      setState(() {
        time = widget.time;
        period = widget.period;
      });
      if(time > 0) {
        startTimer();
      }
    });
  }

  /// 计时器
  void startTimer() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (t) {
        if(time >= 0) {
          setState(() {
            time--;
          });
        } else {
          timer?.cancel();
          timer = null;
          widget.end();
          /// 重复执行
          if(mounted) {
            Future.delayed(Duration(seconds: period), () {
              if(mounted) {
                setState(() {
                  time = widget.time;
                });
                if(time > 0) {
                  startTimer();
                }
              }
            });
          }
        }
      });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(
          color: Colors.blue,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(5.w),
      ),
      alignment: Alignment.center,
      child: Text(
        constructMinuteSecond(time),
        style: TextStyle(
          color: Colors.blue,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
