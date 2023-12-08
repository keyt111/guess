import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TurntableView extends StatefulWidget {
  const TurntableView({Key? key}) : super(key: key);

  @override
  State<TurntableView> createState() => _TurntableViewState();
}

class _TurntableViewState extends State<TurntableView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(220.w, 220.w),
      painter: MyPainter(),
    );
  }
}

class MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = 0.0, sweepAngle = 0.0;
    Rect circle = Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.5),
        radius: size.width * 0.5);
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4.0
      ..style = PaintingStyle.fill;

    for (int i = 1; i <= 16; i++) {
      /// 扇形
      Color color = i % 4 == 0 ? Colors.blue : i % 4 == 1
          ? Colors.green : i % 4 == 2
          ? Colors.amber : Colors.orange;
      startAngle += sweepAngle;
      sweepAngle = 2*pi / 16;
      canvas.drawArc(circle, startAngle, sweepAngle, true,
          paint..color = color);

      /// 文字
      ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
          textAlign: TextAlign.left,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          fontSize: 14))
        ..pushStyle(ui.TextStyle(color: Colors.white))
        ..addText("$i");

      Paragraph paragraph = pb.build()
        ..layout(ParagraphConstraints(width: size.width * 0.5));
      if (sweepAngle >= pi / 8) {
        canvas.translate(size.width * 0.5, size.height * 0.5);
        canvas.rotate(startAngle + sweepAngle * 0.5);
        canvas.drawParagraph(
            paragraph, Offset(size.width * 0.40, 0.0 - paragraph.height * 0.5));
        canvas.rotate(-startAngle - sweepAngle * 0.5);
        canvas.translate(-size.width * 0.5, -size.height * 0.5);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}