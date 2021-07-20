import 'package:flutter/material.dart';
import 'parent_library.dart';
export 'parent_library.dart';

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
        layout = layout ?? defaultBuilder,
        super(key: key);

  final AtWidgetPreference _preference;
  final ButtonBarLayoutBuilder layout;

  @override
  _MyLibraryButtonBarState createState() =>
      _MyLibraryButtonBarState(_preference, layout);
}

class _MyLibraryButtonBarState extends State<MyLibraryButtonBar> {
  AtWidgetPreference preference;
  ButtonBarLayoutBuilder layout;

  _MyLibraryButtonBarState(this.preference, this.layout);

  _doAccept() => print("Accept Pressed");
  _doCancel() => print("Cancel pressed");

  @override
  Widget build(BuildContext context) {
    return layout(
      acceptButton: preference.primaryButtonBuilder(
        child: Text("Accept"),
        onPressed: _doAccept,
      ),
      cancelButton: preference.secondaryButtonBuilder(
        child: Text("Cancel"),
        onPressed: _doCancel,
      ),
    );
  }
}
