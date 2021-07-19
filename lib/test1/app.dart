
import 'package:flexible_widgets/test1/child_library.dart';
import 'package:flexible_widgets/test1/parent_library.dart';
import 'package:flutter/material.dart';

// * This is the code implemented in apps to override the defaults

Map<String, dynamic> customLayout = {
  'widget': 'row',
  'children': [
    Map.from({
      'widget': 'confirm-button',
      'child': Text('Confirm'),
    }),
    Map.from({
      'widget': 'text-button',
      'child': Text('hello'),
      'onPressed': 'onPressed',
    }),
  ],
};

AtWidgetPreference customPreferences = AtWidgetPreference()
  ..textButton = ({required child, onPressed}) {
    return TextButton(
      child: child,
      onPressed: onPressed,
      onLongPress: () {
        print('HELLO LONG PRESS');
      },
    );
  };


MyCustomLayoutBuilder customBuilder = MyCustomLayoutBuilder(
    layout: customLayout,
    preference: customPreferences,
  );
MyCustomLayoutBuilder defaultBuilder = MyCustomLayoutBuilder();
