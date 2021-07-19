import 'package:flutter/material.dart';
import 'test1/app.dart';

class Test1Screen extends StatelessWidget {
  const Test1Screen({Key? key}) : super(key: key);
  static const String id = 'test1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test 1")),
      body: Column(
        children: [
          Text('Test 1 Custom'),
          customBuilder,
          Text('Test 1 Default'),
          defaultBuilder,
        ],
      ),
    );
  }
}
