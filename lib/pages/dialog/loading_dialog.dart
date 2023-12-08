import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/utils/language.dart';

/// 加载提示
class LoadingDialog extends StatefulWidget {
  final String? hit;
  const LoadingDialog({Key? key, this.hit}) : super(key: key);

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.1),
        body: SizedBox(
          width: 1080.w,
          height: 1980.h,
          child: Center(
            child: Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                "${widget.hit??'加载中'.tr}...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

