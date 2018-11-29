import 'dart:async';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class EndgameWonDemo extends StatefulWidget {
  @override
  State<EndgameWonDemo> createState() => _EndgameWonDemoState();
}

class _EndgameWonDemoState extends State<EndgameWonDemo>{

  ImageMap _images;
  bool _loaded = false;

  final Random rand = new Random();

  @override
  void initState() {
    _images = ImageMap(rootBundle);
    _images.load([
      'assets/images/particle-2.png',
    ]).then((List<ui.Image> images) {
      setState(() => _loaded = true);
    });

    _setUpInitialTimer();

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final widget = NodeWithSize(new Size(400.0, 600.0));
    if (_loaded) {
      ParticleSystem particles = new ParticleSystem(
          SpriteTexture(_images['assets/images/particle-2.png']),
          life: 0.5,
          lifeVar: 0.2,
          posVar: ui.Offset(0, 0),
          startSize: 0.6,
          startSizeVar: 0.19,
          endSize: 0.3,
          startRotationVar: 90.0,
          direction: 0.0,
          directionVar: 360,
          speed: 300,
          speedVar: 50,
          maxParticles: 200,
          emissionRate: 1700,
          colorSequence: ColorSequence([Color(0x30ffffff)], [0.0]),
          alphaVar: 30,
          redVar: 175,
          greenVar: 175,
          blueVar: 175,
          numParticlesToEmit: 200,
          gravity: ui.Offset(0.0, 250.0),
      );
      particles.position = ui.Offset(rand.nextInt(400).ceilToDouble(), rand.nextInt(400).ceilToDouble());
      widget.addChild(particles);
    }

    final gameLostScene = Stack(
      children: [
        Center(child: Text('You won!', style: TextStyle(fontFamily: 'LuckiestGuy', fontSize: 48, color: Color(0xFF00FF00))),),
        SpriteWidget(widget),
      ],
    );

    final gestureDetector = GestureDetector(
      child: gameLostScene,
      onTapDown: (_) => setState(() {}),
    );
    return gestureDetector;
  }

  void _setUpInitialTimer() {
    setState(() {});
    new Timer(Duration(milliseconds: ((rand.nextInt(700)+500))), _setUpInitialTimer);
  }
}