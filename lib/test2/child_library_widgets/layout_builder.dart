import 'package:flutter/widgets.dart';

typedef Widget ChildLibrary1LayoutBuilder(
    Widget cancelButton, Widget acceptButton);

Widget defaultChildLibrary1LayoutBuilder(
    Widget cancelButton, Widget acceptButton) {
  return Row(
    children: [
      cancelButton,
      acceptButton,
    ],
  );
}
