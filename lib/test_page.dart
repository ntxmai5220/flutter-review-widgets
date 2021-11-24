import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
            //color: Colors.lightBlue.shade300,
            border: Border.all(color: Colors.amber, width: 5)),
        child: Column(
          children: [
            Card(
              color: Colors.lightBlue.shade300,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Title '),
                  subtitle: Text('SubTitle '),
                  leading: Icon(Icons.home),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Title '),
                subtitle: Text('SubTitle '),
                leading: Icon(Icons.home),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
              ),
              width: 100,
              height: 100,
              //child: Text('ab'),
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
              ),
              width: 100,
              height: 100,
              //child: Text('ab'),
            )
          ],
        ),
      ),
    );
  }
}
