import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/pages/base_page.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/utils/tool.dart';

class RegisterPage extends BasePage {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  BasePageState<BasePage> getState() => _RegisterPageState();
}

class _RegisterPageState extends BasePageState<RegisterPage> {

  FocusNode focusNode = FocusNode();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    accountController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget buildChild(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: pop,
          ),
          title: Text(
            "注册".tr,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Icon(Icons.balance, color: Colors.blue, size: 120.w,),
              SizedBox(
                height: 30.h,
              ),
              _buildItem("账号", accountController),
              _buildItem("密码", passwordController),
              const Spacer(),
              GestureDetector(
                onTap: register,
                child: Container(
                  width: 240.w,
                  height: 30.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25.w),
                  ),
                  child: Text(
                    "注册".tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(String title, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            child: Text(
              title.tr,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.sp,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(5.w),
              ),
              child: TextField(
                controller: controller,
                cursorColor: Colors.grey,
                maxLines: 1,
                maxLength: 20,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.sp,
                ),
                decoration: InputDecoration(
                  /// 去除右下角字符长度提示
                  counterText: "",
                  hintText: "请输入".tr,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void register() {

  }
}
