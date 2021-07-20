import 'package:flexible_widgets/test1/parent_lib/parent_library.dart';
import 'package:flutter/material.dart';

// * This is the code added to manage customization in other libraries
// * Like at_chat_flutter, et alia

Map<String, dynamic> defaultLayout = {
  'widget': 'column',
  'children': [
    {
      'widget': 'confirm-button',
      'child': Text('Ok'),
    },
  ],
};

class MyCustomLayoutBuilder extends AtWidgetsLayoutBuilder {
  MyCustomLayoutBuilder({
    AtWidgetPreference? preference,
    Map<String, dynamic>? layout,
    Key? key,
  }) : super(
          preference: preference,
          layout: layout ?? defaultLayout,
          key: key,
        );

  Map<String, Function> get functions =>
      {'onPressed': () => print('onPressed')};

  Map<String, Function> get widgets => {
        'confirm-button': (child) => preference['text-button']!(
            child: child ?? Text('Confirm'),
            onPressed: () {
              print('Confirm');
            })
      };
}
