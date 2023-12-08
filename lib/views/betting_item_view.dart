import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/betting_info.dart';
import 'package:guess/utils/enum.dart';

class BettingItemView extends ConsumerStatefulWidget {
  final GuessType guessType;  /// 活动类型
  final BettingInfo bettingInfo; /// 投注对象
  final double width;

  const BettingItemView({Key? key,
    required this.width,
    required this.guessType,
    required this.bettingInfo,
  }) : super(key: key);

  @override
  ConsumerState<BettingItemView> createState() => _BettingItemViewState();
}

class _BettingItemViewState extends ConsumerState<BettingItemView> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.bettingInfo.obj??'',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 10.w,),
              Text(
                "x${widget.bettingInfo.odds??''}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h,),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  /// 减1
                },
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2.w,),
              Container(
                width: 40.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5.w),
                ),
                alignment: Alignment.center,
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(width: 2.w,),
              GestureDetector(
                onTap: () {
                  /// 加1
                },
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
