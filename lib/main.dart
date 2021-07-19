import 'package:flexible_widgets/test2.dart';
import 'package:flutter/material.dart';
import 'test1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flexible Widgets',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MyHomePage.id,
        routes: {
          MyHomePage.id: (_) => MyHomePage(title: 'Flexible Widgets Demo'),
          Test1Screen.id: (_) => Test1Screen(),
          Test2Screen.id: (_) => Test2Screen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  static const String id = 'home';
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text("Test 1"),
                onPressed: () {
                  Navigator.of(context).pushNamed(Test1Screen.id);
                },
              ),
              TextButton(
                child: Text("Test 2"),
                onPressed: () {
                  Navigator.of(context).pushNamed(Test2Screen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
