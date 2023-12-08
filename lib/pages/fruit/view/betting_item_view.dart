import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/betting_info.dart';
import 'package:guess/utils/enum.dart';

class BettingItemView extends ConsumerStatefulWidget {
  final GuessType guessType;  /// 活动类型
  final BettingInfo bettingInfo; /// 投注对象
  final double width;
  final bool enable;

  const BettingItemView({Key? key,
    required this.width,
    required this.guessType,
    required this.bettingInfo,
    this.enable = true,
  }) : super(key: key);

  @override
  ConsumerState<BettingItemView> createState() => _BettingItemViewState();
}

class _BettingItemViewState extends ConsumerState<BettingItemView> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        children: [
          Text(
            widget.bettingInfo.obj??'',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(width: 5.w,),
          Expanded(child: Column(
            children: [
              Container(
                width: 50.w,
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
              Row(
                children: [
                  item("-", -1),
                  const Spacer(),
                  item("+", 1),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget item(String text, int type) {
    return GestureDetector(
      onTap: () {
        if(widget.enable) {
          if(type == -1) {
            /// 减1
          }
          if(type == 1) {
            /// 加1
          }
        }
      },
      child: Container(
        width: 20.w,
        height: 20.w,
        decoration: BoxDecoration(
          color: widget.enable ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(5.w),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
