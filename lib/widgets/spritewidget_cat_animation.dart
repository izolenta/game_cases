import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

class SpriteWidgetCatAnimation extends StatefulWidget {
  @override
  _SpriteWidgetCatAnimationState createState() => new _SpriteWidgetCatAnimationState();
}

class _SpriteWidgetCatAnimationState extends State<SpriteWidgetCatAnimation> {
  MyScene rootNode;

  @override
  void initState() {
    super.initState();
    rootNode = MyScene(const Size(800, 800));
  }

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(rootNode);
  }
}

class MyScene extends NodeWithSize {
  Sprite cat;
  VirtualJoystick joystick;

  MyScene(Size size) : super(size) {
    joystick = VirtualJoystick();
    joystick.position = Offset(400, 800);
    this.addChild(joystick);

    ImageMap images = ImageMap(rootBundle);
    images.loadImage('assets/images/cat.png').then((image) {
      cat = Sprite.fromImage(image);
      cat.position = Offset(400, 400);
      this.addChild(cat);

      ActionTween down = ActionTween<Offset> (
                (a) => cat.position = a, const Offset(400, 100), const Offset(400, 500), 1, Curves.bounceOut);

      cat.actions.run(down);

      ActionTween shrink =
        ActionTween<double> ((a) => cat.scale = a, 1, 0.8, 0.5, Curves.easeInOut);

      ActionTween grow =
        ActionTween<double> ((a) => cat.scale = a, 0.8, 1, 0.5, Curves.easeInOut);

      ActionSequence breath = ActionSequence([shrink, grow]);
      cat.actions.run(ActionRepeatForever(breath));
    });

  }

  @override
  void update(double dt) {
    final dx = joystick.value.dx * 10;
    final dy = joystick.value.dy * 10;
    if (cat != null) {
      cat.position += Offset(dx, dy);
    }
  }
}