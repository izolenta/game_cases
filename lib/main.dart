import 'package:flutter/material.dart';
import 'package:game_cases/widgets/endgame_lost_demo.dart';
import 'package:game_cases/widgets/endgame_won_demo.dart';
import 'package:game_cases/widgets/spritewidget_fire_drill.dart';
import 'package:game_cases/widgets/flutter_ghost_animation.dart';
import 'package:game_cases/widgets/spritewidget_cat_animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
      ),
      home:  Material(
        type: MaterialType.transparency,

//          uncomment each to see effect

            child: FireDrill(),
//          child: EndgameLostDemo(),
//          child: EndgameWonDemo(),
//          child: FlutterGhostAnimation(),
//          child: SpriteWidgetCatAnimation(),

      )
    );
  }
}
