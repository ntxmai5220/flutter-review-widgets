import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class MyMovement extends StatefulWidget {
  const MyMovement({Key? key}) : super(key: key);

  @override
  _MyMovementState createState() => _MyMovementState();
}

class _MyMovementState extends State<MyMovement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _movementAnimation;
  late double sliderVal;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(
            //reverse: true,        co the di nguoc tu duoi len
          );
    _movementAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(100, 0, 100, 200),
      end: RelativeRect.fromLTRB(100, 200, 100, 0),
    ).animate(_controller);
    super.initState();
    _controller.addListener(() {
      setState(() {}); //Transform => moi su dung duoc
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _movementAnimation,
            child: FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
