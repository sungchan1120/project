import 'package:flutter/material.dart';
import 'package:project/screens/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Loading(
        city: 'Seoul',
        latitude: 37.5665,
        longitude: 126.9780,
      ),
    );
  }
}
