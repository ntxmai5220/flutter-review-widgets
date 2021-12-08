import 'dart:math';

import 'package:flutter/material.dart';
import 'package:review_widgets/widgets/animation/movement.dart';
import 'package:review_widgets/widgets/animation/rotation.dart';
import 'package:review_widgets/widgets/animation/scale.dart';
import 'package:review_widgets/widgets/animation/shared_mybutton.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(
              toRotation, Text('Rotation', style: TextStyle(fontSize: 13))),
          MyButton(toScale, Text('Scale', style: TextStyle(fontSize: 13))),
          MyButton(toMovement, Text('Movement', style: TextStyle(fontSize: 10)))
        ],
      ),
    ));
  }

  void toRotation() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MyRotation()));
  }

  void toScale() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MyScale()));
  }

  void toMovement() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MyMovement()));
  }
}
