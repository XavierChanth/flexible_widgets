import 'package:flutter/material.dart';
import '../parent_lib/parent_library.dart';
export '../parent_lib/parent_library.dart';

typedef Widget ButtonBarLayoutBuilder(
    {required Widget acceptButton, required Widget cancelButton});

ButtonBarLayoutBuilder defaultBuilder =
    ({required Widget acceptButton, required Widget cancelButton}) {
  return Column(
    children: [acceptButton, cancelButton],
  );
};

class MyLibraryButtonBar extends StatefulWidget {
  MyLibraryButtonBar(
      {AtWidgetPreference? preference,
      ButtonBarLayoutBuilder? layout,
      Key? key})
      : _preference = preference ?? AtWidgetPreference(),
        _layout = layout ?? defaultBuilder,
        super(key: key);

  final AtWidgetPreference _preference;
  final ButtonBarLayoutBuilder _layout;

  @override
  _MyLibraryButtonBarState createState() => _MyLibraryButtonBarState();
}

class _MyLibraryButtonBarState extends State<MyLibraryButtonBar> {
  _doAccept() => print("Accept Pressed");
  _doCancel() => print("Cancel pressed");

  @override
  Widget build(BuildContext context) {
    return widget._layout(
      acceptButton: widget._preference.primaryButtonBuilder(
        child: Text("Accept"),
        onPressed: _doAccept,
      ),
      cancelButton: widget._preference.secondaryButtonBuilder(
        child: Text("Cancel"),
        onPressed: _doCancel,
      ),
    );
  }
}
