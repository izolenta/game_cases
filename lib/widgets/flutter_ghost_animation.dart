import 'package:flutter/widgets.dart';

class FlutterGhostAnimation extends StatefulWidget {
  @override
  State<FlutterGhostAnimation> createState()
    => _FlutterGhostAnimationState();
}

class _FlutterGhostAnimationState
    extends State<FlutterGhostAnimation>
    with SingleTickerProviderStateMixin {

  static const spriteDimension = 128;

  Animation<double> animation;
  AnimationController controller;
  Image image;

  @override
  void initState() {
    image = Image.asset('assets/images/ghost.png');
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this);
    final CurvedAnimation curve = CurvedAnimation(
        parent: controller,
        curve: Curves.bounceOut);
    animation = Tween(begin: 0.0, end: 128.0).animate(curve)
      ..addListener(() => setState(() {}));
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {

    final image = Image.asset(
        'assets/images/ghost.png',
       width: animation.value,
       height: animation.value
    );

    final widget = Center(
      child: image,
    );

    return GestureDetector(
      child: Container(
        child: widget,
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff333333),
      ),

      onTapDown: (_) {
        controller.reset();
        controller.forward();
      },
    );
  }
}