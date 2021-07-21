import 'package:flexible_widgets/test3/child_lib/child_library.dart';
import 'package:flutter/material.dart';

AtWidgetPreference atWidgetPreference = AtWidgetPreference()
  ..primaryButtonBuilder = ({required child, onPressed}) {
    // * You can add wrappers around the widget.
    return Container(
      margin: EdgeInsets.all(40),
      child: TextButton(
        // * App developers can choose not to use the default child
        child: Text("Confirm", style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
        ),
        onPressed: () {
          // * App developers can extend the onPressed function,
          // * or completely change it if needed.
          print("App added logic to onPressed!");
          if (onPressed != null) onPressed();
        },
      ),
    );
  };

ButtonBarLayoutBuilder layoutBuilder =
    ({required acceptButton, required cancelButton}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      cancelButton,
      acceptButton,
    ],
  );
};
