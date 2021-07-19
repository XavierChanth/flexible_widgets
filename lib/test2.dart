import 'package:flexible_widgets/test2/app.dart';
import 'package:flexible_widgets/test2/child_library.dart';
import 'package:flutter/material.dart';

class Test2Screen extends StatelessWidget {
  const Test2Screen({Key? key}) : super(key: key);
  static const String id = 'test2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test 2")),
      body: Column(
        children: [
          Text('Test 2 Custom'),
          MyLibraryScreen(
            preference: preference,
          ),
          Text('Test 2 Default'),
          MyLibraryScreen(),
        ],
      ),
    );
  }
}

final MyPreference preference = MyPreference()
  ..cancelButton = ({required VoidCallback? onPressed, required Widget child}) {
    return TextButton(
        child: Text('reset'),
        onPressed: () {
          if (onPressed != null) onPressed();
          preference.setChildLibraryState(() {
            preference.childLibraryCounter = 0;
          });
        });
  };
