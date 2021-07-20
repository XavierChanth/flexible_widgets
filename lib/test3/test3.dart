import 'package:flexible_widgets/test3/app/app.dart';
import 'package:flexible_widgets/test3/child_lib/child_library.dart';
import 'package:flutter/material.dart';

class Test3Screen extends StatelessWidget {
  const Test3Screen({Key? key}) : super(key: key);
  static const String id = 'test3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test 3")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Test 3 Custom Widgets Only'),
          MyLibraryButtonBar(
            preference: atWidgetPreference,
          ),
          //
          //
          Text('Test 3 Custom Layout Only'),
          MyLibraryButtonBar(
            layout: layoutBuilder,
          ),
          //
          //
          Text('Test 3 Custom Both'),
          MyLibraryButtonBar(
            preference: atWidgetPreference,
            layout: layoutBuilder,
          ),
          //
          //
          Text('Test 3 Default'),
          MyLibraryButtonBar(),
        ],
      ),
    );
  }
}
