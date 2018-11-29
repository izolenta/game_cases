import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

class SpriteWidgetMenuAnimation extends StatefulWidget {
  @override
  _SpriteWidgetMenuAnimationState createState() => new _SpriteWidgetMenuAnimationState();
}

class _SpriteWidgetMenuAnimationState extends State<SpriteWidgetMenuAnimation> {
  NodeWithSize rootNode;
  Sprite cat;

  @override
  void initState() {
    super.initState();
    ImageMap images = ImageMap(rootBundle);

    rootNode = NodeWithSize(const Size(800, 800));

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