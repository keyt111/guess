import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/providers/turntable_provider.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/utils/tool.dart';

class RecordView extends ConsumerStatefulWidget {
  const RecordView({Key? key}) : super(key: key);

  @override
  ConsumerState<RecordView> createState() => _RecordViewState();
}

class _RecordViewState extends ConsumerState<RecordView> {

  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(turntableProvider).record;
    return Expanded(child: Column(
      children: [
        SizedBox(height: 2.h,),
        Expanded(child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              ...items.reversed.map((e) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                child: Row(
                  children: [
                    Text(
                      e.period??'',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    for(var i = 1; i <= 16; i++)
                      Container(
                        width: 11.5.w,
                        height: 11.5.w,
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        decoration: BoxDecoration(
                          color: e.number == "$i" ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(11.w),
                          border: Border.all(
                            color: e.number == "$i" ? Colors.blue : Colors.grey,
                            width: 0.5.w,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$i",
                          style: TextStyle(
                            color: e.number == "$i" ? Colors.white : Colors.grey,
                            fontSize: 6.sp,
                          ),
                        ),
                      ),
                    SizedBox(width: 5.w,),
                    Container(
                      width: 11.5.w,
                      height: 11.5.w,
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      decoration: BoxDecoration(
                        color: getColor(e.color),
                        borderRadius: BorderRadius.circular(11.w),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ],
          ),
        )),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {

          },
          child: Text(
            "更多>>".tr,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10.sp,
            ),
          ),
        )
      ],
    ));
  }
}
