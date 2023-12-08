// import 'package:flutter/material.dart';
//
// class MarqueeText extends StatefulWidget {
//   final Widget child;
//   final int speed;
//   const MarqueeText({Key? key, required this.child, this.speed = 10}) : super(key: key);
//
//   @override
//   State<MarqueeText> createState() => _MarqueeTextState();
// }
//
// class _MarqueeTextState extends State<MarqueeText> with SingleTickerProviderStateMixin {
//
//   late AnimationController controller;
//   late Animation<double> animation;
//   late ScrollController scroll;
//   SingleChildScrollView? scrollView;
//
//   double space = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     scroll = ScrollController();
//     controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: widget.speed),
//     );
//     animation = Tween(begin: 0.1, end: 100.0).animate(controller);
//     animation.addListener(() {
//       if(scroll.hasClients) {
//         if(scrollView != null && scroll.position.hasContentDimensions) {
//           var index = animation.value / 100;
//           scroll.jumpTo(index * scroll.position.maxScrollExtent);
//         }
//         if(scroll.position.hasViewportDimension && space == 0) {
//           setState(() {
//             space = scroll.position.viewportDimension;
//           });
//         }
//       }
//     });
//     controller.repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     scrollView = SingleChildScrollView(
//       controller: scroll,
//       scrollDirection: Axis.horizontal,
//       child: scroll.hasClients ? Row(
//         children: [
//           SizedBox(width: space,),
//           widget.child,
//           SizedBox(width: space,),
//         ],
//       ) : const SizedBox(),
//     );
//     return scrollView ?? Column();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final Widget child;  /// 轮播的内容
  final Duration duration;  /// 轮播的时间
  final double offset;  /// 偏移量
  final double paddingLeft;  /// 内容之间的距离
  const MarqueeText({Key? key,
    required this.child,
    required this.duration,
    this.offset = 100.0,
    this.paddingLeft = 10,
  }) : super(key: key);

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {

  late ScrollController controller;
  late Timer timer;
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    controller = ScrollController(initialScrollOffset: offset);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.animateTo(widget.offset, duration: widget.duration, curve: Curves.linear);
    });
    timer = Timer.periodic(widget.duration, (timer) {
      double no = controller.offset + widget.offset;
      if(no != offset) {
        offset = no;
        controller.animateTo(offset, duration: widget.duration, curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: controller,
      itemBuilder: (_, index) {
        List<Widget> items = [];
        for(var i = 0; i <= 2; i++) {
          items.add(
            Container(
              margin: EdgeInsets.only(right: i != 0 ? 0.0 : widget.paddingLeft),
              child: i != 0 ? null : widget.child,
            )
          );
        }
        return Row(children: items,);
      },
    );
  }
}
