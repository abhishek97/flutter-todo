import 'package:flutter/material.dart';
import './TodoList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('TodoList by @abhishek97'), backgroundColor: Colors.black),
          body: TodoList()),
    );
  }
}