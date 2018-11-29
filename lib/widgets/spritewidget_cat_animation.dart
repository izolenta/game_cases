import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

class SpriteWidgetCatAnimation extends StatefulWidget {
  @override
  _SpriteWidgetCatAnimationState createState() => new _SpriteWidgetCatAnimationState();
}

class _SpriteWidgetCatAnimationState extends State<SpriteWidgetCatAnimation> {
  NodeWithSize rootNode;
  Sprite cat;
  VirtualJoystick joystick;

  @override
  void initState() {
    super.initState();
    ImageMap images = ImageMap(rootBundle);
    joystick = VirtualJoystick();
    joystick.position = Offset(400, 800);
    rootNode = NodeWithSize(const Size(800, 800));
    rootNode.addChild(joystick);

    joystick.

    images.loadImage('assets/images/cat.png').then((image) {
      cat = Sprite.fromImage(image);
      cat.position = Offset(400, 400);
      rootNode.addChild(cat);

      ActionTween down = ActionTween<Offset> (
              (a) => cat.position = a,
          const Offset(400, 100),
          const Offset(400, 500),
          1,
          Curves.bounceOut
      );
      cat.actions.run(down);
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return SpriteWidget(rootNode);
  }
}