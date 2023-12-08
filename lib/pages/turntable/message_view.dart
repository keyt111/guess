import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guess/models/message_info.dart';
import 'package:guess/utils/language.dart';
import 'package:guess/utils/toast.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  ScrollController controller = ScrollController();
  FocusNode focusNode = FocusNode();
  TextEditingController msgController = TextEditingController();

  List<MessageInfo> items = [
    MessageInfo(nickname: "管理员一号", msg: "加倍", role: 1),
    MessageInfo(nickname: "小白一号", msg: "跟投", role: 0),
    MessageInfo(nickname: "小白二号", msg: "好的", role: 0),
    MessageInfo(nickname: "小白三号", msg: "不跟了", role: 0),
    MessageInfo(nickname: "管理员一号", msg: "07251630 3 橙色", role: 1),
    MessageInfo(nickname: "管理员一号", msg: "上上上", role: 1),
    MessageInfo(nickname: "小白一号", msg: "加倍已投", role: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                ...items.reversed.map((e) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Offstage(
                        offstage: e.role != 1,
                        child: Container(
                          width: 10.w,
                          height: 10.w,
                          margin: EdgeInsets.only(top: 3.h),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "G",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${e.nickname}: ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12.sp,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          e.msg??'',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ],
            ),
          )),
          Container(
            constraints: BoxConstraints(
              minHeight: 30.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: TextField(
                      controller: msgController,
                      cursorColor: Colors.grey,
                      maxLines: null,
                      keyboardType: TextInputType.text,
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
                GestureDetector(
                  onTap: () {
                    String msg = msgController.text;
                    if(msg.trim().isEmpty) {
                      Toast().toast(context, msg: "不能发送空消息".tr);
                      return;
                    }
                    /// 发送消息
                    items.insert(0, MessageInfo(nickname: "管理员一号", msg: msg, role: 1),);
                    setState(() {});
                    controller.jumpTo(
                      controller.position.maxScrollExtent + 15.h,
                    );
                    msgController.text = "";
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Text(
                      "发送".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
