import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/routers/my_routers.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/views/marquee_text.dart';

class HallPage extends StatefulWidget {
  const HallPage({Key? key}) : super(key: key);

  @override
  State<HallPage> createState() => _HallPageState();
}

class _HallPageState extends State<HallPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320.w,
          height: 35.h,
          color: Colors.white,
          alignment: Alignment.center,
          child: Text(
            "娱乐大厅".tr,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                _buildItem(MyRouters.dice, "骰子", Icons.dataset, "猜大小，猜点数，欢乐不停!"),
                _buildItem(MyRouters.turntable, "俄罗斯转盘", Icons.palette, "押单双点数，押中大赢家!"),
                _buildItem(MyRouters.racecourse, "跑马场", Icons.radar, "你心中跑的最快的是几号马呢?"),
                _buildItem(MyRouters.fruit, "水果老虎机", Icons.apple, "能不能选中喜欢的水果呢?"),
                _buildItem(MyRouters.m10, "快乐10分钟", Icons.hourglass_bottom, "马上开奖，惊喜不停!"),
                _buildItem(MyRouters.very32, "非常3+2", Icons.add_home, "搏一搏，单车变奥迪!"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildItem(String routeName, String title, IconData? icon, String decoration) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        child: Container(
          width: 140.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Column(
            children: [
              Text(
                title.tr,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon, color: Colors.black87, size: 60.w,),
              SizedBox(
                height: 20.h,
                child: MarqueeText(
                  duration: const Duration(milliseconds: 2000),
                  child: Text(
                    decoration.tr,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
