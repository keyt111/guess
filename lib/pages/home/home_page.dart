import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/pages/home/hall_page.dart';
import 'package:guess/pages/home/me_page.dart';
import 'package:guess/providers/language_provider.dart';
import 'package:guess/utils/language.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {

  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget buildChild(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  HallPage(),
                  MePage(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTabItemView(0, Icons.home, "大厅"),
                  Container(
                    width: 1.w,
                    height: 20.h,
                    color: Colors.grey.shade200,
                  ),
                  _buildTabItemView(1, Icons.person, "我的"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTabItemView(int index, IconData? icon, String title) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if(currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
            controller.jumpToPage(index);
          }
        },
        child: Center(
          child: Column(
            children: [
              Icon(
                icon,
                size: 20.w,
                color: currentIndex == index ? Colors.blue : Colors.grey,
              ),
              Text(
                title.tr,
                style: TextStyle(
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
