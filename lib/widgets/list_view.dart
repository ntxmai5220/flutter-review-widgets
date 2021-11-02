import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _basicHorizontalListView()),
    );
  }

  _basicListView() {
    return ListView(
      children: _tiles(),
    );
  }

  _basicDividedListView() {
    return ListView(
      children:
          ListTile.divideTiles(context: context, tiles: _tiles()).toList(),
    );
  }

  _basicListViewBuilder() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => _tile(index),
    );
  }

  _basicListViewSeperated() {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) => _tile(index),
      separatorBuilder: (context, index) => Divider(),
    );
  }

  _basicHorizontalListView() {
    return Container(
      height: 70, // limit height
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => _horizontalTile(index)),
    );
  }

  List<Widget> _tiles() {
    return [
      ListTile(
        title: Text('Title'),
        subtitle: Text('SubTitle'),
        leading: Icon(Icons.home),
        tileColor: Colors.orange.shade200,
      ),
      ListTile(
        title: Text('Title 2'),
        subtitle: Text('SubTitle 2'),
        leading: Icon(Icons.home),
      ),
      ListTile(
        title: Text('Title'),
        subtitle: Text('SubTitle'),
        leading: Icon(Icons.home),
      ),
      ListTile(
        title: Text('Title 2'),
        subtitle: Text('SubTitle 2'),
        leading: Icon(Icons.home),
      )
    ].toList();
  }

  _tile(index) {
    return ListTile(
      title: Text('Title $index'),
      subtitle: Text('SubTitle $index'),
      leading: Icon(Icons.home),
    );
  }

  _horizontalTile(index) {
    return Card(
      //shape: CircleBorder(),
      child: InkWell(
        //radius: 50,
        onTap: () {},
        child: Container(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.access_alarm), Text('$index')],
          ),
        ),
      ),
    );
    // Container(
    //   margin: EdgeInsets.all(5),
    //   decoration: BoxDecoration(
    //     border: Border.all(),
    //   ),
    //   //height: 70,   unnecessary
    //   width: 110,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [Icon(Icons.access_alarm), Text('$index')],
    //   ),
    // );
  }
}
