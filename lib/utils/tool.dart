import 'package:flutter/material.dart';

/// 时间差转时分秒
String constructTime(int seconds) {
  if(seconds > 0) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return "${formatTime(hour)}:${formatTime(minute)}:${formatTime(second)}";
  }
  return "00:00:00";
}

/// 时间差转时分秒
String constructMinuteSecond(int seconds) {
  if(seconds > 0) {
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return "${formatTime(minute)}:${formatTime(second)}";
  }
  return "00:00";
}

/// 补位
String formatTime(int timeNum) {
  return timeNum < 10 ? "0$timeNum" : timeNum.toString();
}

/// 时间转换格式
String getTime(String? date, {String format = "yyyy-MM-dd HH:mm:ss"}) {
  String time = "";
  if(date == null) {
    return time;
  }
  DateTime dateTime = DateTime.parse(date);
  switch(format) {
    case "yyyy-MM-dd HH:mm:ss":
      time = "${dateTime.year}-${formatTime(dateTime.month)}-${formatTime(dateTime.day)} "
          "${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}:${formatTime(dateTime.second)}";
      break;
    case "yyyy-MM-dd HH:mm":
      time = "${dateTime.year}-${formatTime(dateTime.month)}-${formatTime(dateTime.day)} "
          "${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}";
      break;
    case "yyyy-MM-dd":
      time = "${dateTime.year}-${formatTime(dateTime.month)}-${formatTime(dateTime.day)}";
      break;
    case "dd-MM-yyyy":
      time = "${dateTime.day}-${formatTime(dateTime.month)}-${formatTime(dateTime.year)}";
      break;
    case "HH:mm":
      time = "${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}";
      break;
    case "HH:mm:ss":
      time = "${formatTime(dateTime.hour)}:${formatTime(dateTime.minute)}:${formatTime(dateTime.second)}";
      break;
    case "yyyy年MM月dd日":
      time = "${dateTime.year}年${formatTime(dateTime.month)}月${formatTime(dateTime.day)}日";
      break;
  }
  return time;
}


/// buff加成转百分比
double getBuffAdd(double? d) {
  if(d == null) {
    return 0.0;
  }
  return d*100;
}

/// 字符串格式化
String getStringFormat(String str) {
  if(str.isEmpty || str.length < 8) {
    return str;
  }
  return "${str.substring(0, 4)}****${str.substring(str.length - 4)}";
}

/// 去除文字换行留白
extension FixAutoLines on String {
  String fixAutoLines() {
    return Characters(this).join('\u{200B}');
  }
}

/// 参数拼接
String paramsUtil(Map map, String k) {
  String uri = '';
  map.forEach((key, value) {
    uri += "$key$value";
  });
  if(uri.isNotEmpty) {
    uri += k;
  } else {
    uri = k;
  }
  return uri.toUpperCase();
}

/// 获取颜色
Color getColor(String? c) {
  Color color = Colors.grey;
  switch (c) {
    case "蓝色":
    case "blue":
      color = Colors.blue;
      break;
    case "绿色":
    case "green":
      color = Colors.green;
      break;
    case "橙色":
    case "orange":
      color = Colors.orange;
      break;
    case "黄色":
    case "amber":
      color = Colors.amber;
      break;
  }
  return color;
}

/// 关闭键盘
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if(!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}