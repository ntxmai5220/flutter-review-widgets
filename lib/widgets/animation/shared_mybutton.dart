import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget child;
  const MyButton( this.onPress,  this.child,{Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: ElevatedButton(
          onPressed: onPress,
          child: child,
          style: ElevatedButton.styleFrom(
            primary: Colors.blue.shade900,
            padding: EdgeInsets.all(15),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(55.0),
            ),
          )),
    );
  }
}
