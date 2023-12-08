import 'package:flutter/material.dart';

class AnimatedBtn extends StatefulWidget {
  final Widget child;
  final Function() onTap;
  final bool enable;
  const AnimatedBtn({Key? key,
    required this.child,
    required this.onTap,
    this.enable = true,
  }) : super(key: key);

  @override
  State<AnimatedBtn> createState() => _AnimatedBtnState();
}

class _AnimatedBtnState extends State<AnimatedBtn> with SingleTickerProviderStateMixin {
  ///按钮动画
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0.95, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.ease),
    );
  }

  void onTap() {
    if(widget.enable) {
      controller.reset();
      controller.forward();
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.status == AnimationStatus.forward
              ? animation.value
              : 1,
          child: GestureDetector(
            onTap: onTap,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
