import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dev',
    home: Counter(),
  ));
}

class DevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: "Menu",
        ),
        title: Text("Dev"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
            tooltip: "Search",
          )
        ],
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            // MyButon
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null, tooltip: "Click", child: Icon(Icons.add)),
    );
  }
}

//Handling gestures
class MyButon extends StatelessWidget {
  const MyButon({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("This is my demo");
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(child: Text("Engage")),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void __increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: __increment,
          child: Text("Increment"),
        ),
        Text('Count: $_counter')
      ],
    );
  }
}
