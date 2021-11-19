import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            BackButton(),
            _buildListElevatedButton(),
          ],
        ),
      ),
    );
  }

  _buildListElevatedButton() {
    return Column(
      children: [
        _fullElevatedButton(
          'RoundedRectangleBorder',
          Colors.amber,
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        Divider(),
        _fullElevatedButton(
          'BeveledRectangleBorder',
          Colors.deepPurple,
          BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Divider(),
        _fullElevatedButton(
          'ContinuousRectangleBorder',
          Colors.lime,
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _iconContinuousRectangleButton(Colors.red.shade900),
            _iconContinuousRectangleButton(Colors.green.shade900),
            _iconContinuousRectangleButton(Colors.blue.shade900)
          ],
        ),
      ],
    );
  }

  _iconContinuousRectangleButton(color) => Container(
        height: 65,
        width: 65,
        child: _fullElevatedButton(
          '',
          color,
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(55.0),
          ),
        ),
      );
  _fullElevatedButton(text, color, shape) => ElevatedButton(
        onPressed: (){},  //replace function by null -> disabled button
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_circle),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(15),
          shape: shape,
        ),
      );
}
