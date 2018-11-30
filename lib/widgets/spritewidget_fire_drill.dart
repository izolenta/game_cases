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


    _images.load([
      'assets/images/particle-4.png',
      'assets/images/particle-0.png',
      'assets/images/tree.png',
    ]).then((_) {

      final tree = Sprite.fromImage(_images['assets/images/tree.png']);
      tree.position = Offset(200, 350);
      tree.scaleX = 0.5;
      tree.scaleY = 0.6;
      rootNode.addChild(tree);

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

      ParticleSystem particles2 = new ParticleSystem(
        SpriteTexture(_images['assets/images/particle-0.png']),
        life: 2,
        lifeVar: 0,
        posVar: ui.Offset(450, 0),
        startSize: 0.5,
        startSizeVar: 0,
        endSize: 0,
        endSizeVar: 0,
        startRotation: 9,
        startRotationVar: 0,
        endRotation: 9,
        endRotationVar: 0,
        direction: 97.0,
        directionVar: 0,
        speed: 215,
        speedVar: 50,
        maxParticles: 1000,
        emissionRate: 200,
        colorSequence: ColorSequence([Color(0xFFAAAAFF), Color(0xFFCCCCFF)], [0.21, 0.62]),
        numParticlesToEmit: 0,
        gravity: ui.Offset(0, 84),
      );

      particles2.position = Offset(0, -10);
      particles2.zPosition = -100;
      rootNode.addChild(particles2);
    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SpriteWidget(rootNode);
  }
}