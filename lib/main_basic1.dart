import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// final cameras = await availableCameras();

// final firstCamera = cameras.first;

List<CameraDescription> cameras;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  // final firstCamera = cameras.first;
  runApp(MaterialApp(title: 'My App', home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[800]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
            tooltip: 'Naviagtion',
          ),
          Expanded(child: null),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
            tooltip: 'Search',
          )
        ],
      ),
    );
  }
}
