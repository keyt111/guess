import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  const AnimatedText({Key? key, required this.text, this.style}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {

  String text = "";

  TextStyle style = TextStyle(
    color: Colors.black87,
    fontSize: 14.sp,
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      style = widget.style ?? style;
    });
    /// 设置逐个显示动画
    setAnimation(0);
  }

  /// 逐个显示动画
  void setAnimation(int index) {
    if(mounted) {
      setState(() {
        text = widget.text.substring(0, index);
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        int i = index < widget.text.length ? index+1 : 0;
        setAnimation(i);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
