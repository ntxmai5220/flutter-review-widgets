import 'package:flutter/material.dart';

import 'shared_mybutton.dart';

class MyController extends StatelessWidget {
  final AnimationController _controller;
  const MyController(this._controller,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyButton(reset, Icon(Icons.undo_rounded)),
          MyButton(
              repeat,
              Text('Repeat',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700))),
          MyButton(
              repeatAndReverse,
              Text('Repeat & Reverse',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)))
        ],
      ),
    );
  }

  void reset() {
    if (_controller.isCompleted) {
      _controller.reverse();  //reverse hien tai begin -> end sau reverse : end -> begin
    } else {
      _controller.forward();
    }
  }

  void repeat() {
    if (_controller.isCompleted) {
      _controller.repeat(); //lap lai tu dau
    } else {
      _controller.forward();
    }
  }

  void repeatAndReverse() {
    if (_controller.isCompleted) {
      _controller.repeat(
        reverse: true,  // lap lai nhung reverse tu end -> begin, begin -> end
        //period: Duration(seconds: 5),
      );
    } else {
      _controller.forward();
    }
  }
}

