import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class FireDrill extends StatefulWidget {
  @override
  State<FireDrill> createState() => _FireDrillState();
}

class _FireDrillState extends State<FireDrill>{

  ImageMap _images;
  NodeWithSize rootNode;

  @override
  void initState() {
    _images = ImageMap(rootBundle);
    rootNode = NodeWithSize(new Size(400.0, 600.0));
    final label = Label(
        'FIRE!',
        textAlign: TextAlign.center,
        textStyle: TextStyle(fontFamily: 'LuckiestGuy', fontSize: 96, color: Color(0xFFFF0000))
    );
    label.position = Offset(200, 300);
    label.zPosition = 1000;
    rootNode.addChild(label);
    _images.load(['assets/images/particle-4.png',]).then((_) {
      ParticleSystem particles = new ParticleSystem(
        SpriteTexture(_images['assets/images/particle-4.png']),
        life: 1.5,
        lifeVar: 0,
        posVar: ui.Offset(400, 0),
        startSize: 1,
        startSizeVar: 0.5,
        endSize: 0,
        endSizeVar: 0,
        startRotationVar: 0,
        endRotationVar: 200,
        direction: -63.0,
        directionVar: 0,
        speed: 120,
        speedVar: 20,
        maxParticles: 1000,
        emissionRate: 700,
        colorSequence: ColorSequence([Color(0xFFA40000), Color(0xFFC2C000)], [0.21, 0.62]),
        numParticlesToEmit: 0,
        gravity: ui.Offset(0, 11),
      );
      particles.position = Offset(0, 610);
      rootNode.addChild(particles);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SpriteWidget(rootNode);
  }
}