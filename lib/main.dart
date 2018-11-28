import 'package:flutter/material.dart';
import 'package:game_cases/widgets/endgame_lost_demo.dart';
import 'package:game_cases/widgets/endgame_won_demo.dart';
import 'package:game_cases/widgets/flutter_ghost_animation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
      ),
      home:  Material(
        type: MaterialType.transparency,
        child: EndgameLostDemo(),
//        child: EndgameWonDemo(),
//          child: FlutterGhostAnimation(),
      )
    );
  }
}
