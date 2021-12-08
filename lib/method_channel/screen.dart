import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  static const platform = MethodChannel('com.example.review_widgets/battery');
  String battery = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(battery),
          ElevatedButton(
              onPressed: () {
                _getBattery();
              },
              child: Text('Click me!'))
        ],
      ),
    );
  }

  Future<void> _getBattery() async {
    try {
      final int result = await platform.invokeMethod('getBattery');
      battery = '$result %';
    } on PlatformException catch (e) {
      battery = e.message ?? 'Error';
    }
    setState(() {});
  }
}
