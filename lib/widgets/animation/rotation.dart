import 'dart:math';

import 'package:flutter/material.dart';
import 'package:review_widgets/widgets/animation/my_controller.dart';

class MyRotation extends StatefulWidget {
  const MyRotation({Key? key}) : super(key: key);

  @override
  _MyRotationState createState() => _MyRotationState();
}

class _MyRotationState extends State<MyRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation, _rotate;
  late double sliderVal;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //rotate
    _rotate = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _rotateAnimation = Tween<double>(begin: 0.0, end: 360.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: RotationTransition(
                //transform: Matrix4.rotationZ(_rotateAnimation.value * pi / 90),
                turns: _rotate,
                child: FlutterLogo(size: 100.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Transform(
                origin: Offset(75, 75), //tâm quay
                transform: Matrix4.rotationZ(_rotateAnimation.value * pi / 180), //quay quanh truc Z
                //..rotateX(_rotateAnimation.value * pi / 180), //quay quanh truc X
                child: FlutterLogo(size: 100.0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyController(_controller),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
