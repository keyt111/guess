import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointerView extends StatefulWidget {
  const PointerView({Key? key}) : super(key: key);

  @override
  State<PointerView> createState() => _PointerViewState();
}

class _PointerViewState extends State<PointerView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AnglePainter(),
    );
  }
}

class AnglePainter extends CustomPainter {

  AnglePainter() : super();

  final Paint pointPaint = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.white
    ..strokeWidth = 1;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    Path arrowPath = Path();
    arrowPath
      ..relativeLineTo(85.w - 10, 6)
      ..relativeLineTo(0, 5)
      ..lineTo(85.w, 0)
      ..relativeLineTo(-10, -10)
      ..relativeLineTo(0, 4)..close();
    canvas.drawPath(arrowPath,pointPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}