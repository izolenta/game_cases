import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class EndgameLostDemo extends StatefulWidget {
  @override
  State<EndgameLostDemo> createState() => _EndgameLostDemoState();
}

class _EndgameLostDemoState extends State<EndgameLostDemo>{

  ImageMap _images;
  bool _loaded = false;

  @override
  void initState() {
    _images = ImageMap(rootBundle);
    _images.load([
      'assets/images/particle-2.png',
    ]).then((List<ui.Image> images) {
      setState(() => _loaded = true);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final widget = NodeWithSize(new Size(400.0, 600.0));
    if (_loaded) {
      ParticleSystem particles = new ParticleSystem(
          SpriteTexture(_images['assets/images/particle-2.png']),
          life: 5,
          lifeVar: 0,
          posVar: ui.Offset(400, 0),
          startSize: 0.4,
          endSize: 0.2,
          startRotationVar: 90.0,
          direction: 90.0,
          directionVar: 0,
          speed: 300,
          speedVar: 100,
          maxParticles: 700,
          emissionRate: 700,
          colorSequence: ColorSequence([Color(0x20ffffff)], [0.0]),
          numParticlesToEmit: 700,
          gravity: ui.Offset(0.0, 900.0),
      );
      widget.addChild(particles);
    }

    final gameLostScene = Stack(
      children: [
        Center(
          child: Text(
              'Game Over',
              style: TextStyle(
                  fontFamily: 'LuckiestGuy',
                  fontSize: 48,
                  color: Color(0xFFc5060b)
              )
          ),
        ),
        SpriteWidget(widget),
      ],
    );

    final gestureDetector = GestureDetector(
      child: gameLostScene,
      onTapDown: (_) => setState(() {}),
    );
    return gestureDetector;
  }
}