import 'dart:math';

import 'package:flutter/material.dart';
import 'package:review_widgets/widgets/animation/my_controller.dart';

import 'shared_mybutton.dart';

class MyScale extends StatefulWidget {
  const MyScale({Key? key}) : super(key: key);

  @override
  _MyScaleState createState() => _MyScaleState();
}

class _MyScaleState extends State<MyScale> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation, _scale;
  late double sliderVal;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //scale .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInCubic))
    _rotateAnimation = Tween<double>(begin: 0.0, end: 360.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _scale = Tween<double>(begin: 0.3, end: 1.3).animate(_controller);
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
              //child: RotationTransition(
              //turns: _rotate,
              child: ScaleTransition(
                //transform: Matrix4.rotationZ(_rotateAnimation.value * pi / 90),
                scale: _scale,
                child: FlutterLogo(size: 100.0),
              ),
            ),
            //),
          ),
          Expanded(
            child: Center(
              child: Transform(
                origin: Offset(75, 75), //tâm quay
                transform: Matrix4.rotationZ(_rotateAnimation.value * pi / 180)
                  ..scale(_scale.value),
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
