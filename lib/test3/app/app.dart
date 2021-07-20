import 'package:flexible_widgets/test3/child_lib/child_library.dart';
import 'package:flutter/material.dart';

AtWidgetPreference atWidgetPreference = AtWidgetPreference()
  ..primaryButtonBuilder = ({required child, onPressed}) {
    // * App developers can extend the onPressed function,
    // * or completely change it if needed
    void Function() myOnPressed = () {
      print("App added logic to onPressed!");
      if (onPressed != null) onPressed();
    };

    // * You can add wrappers around the widget as well.
    return Container(
      margin: EdgeInsets.all(20),
      child: TextButton(
        // * App developers can choose not to use the default child
        child: Text("Confirm", style: TextStyle(color: Colors.white)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        onPressed: myOnPressed,
      ),
    );
  };

ButtonBarLayoutBuilder layoutBuilder =
    ({required acceptButton, required cancelButton}) {
  return Row(
    children: [
      cancelButton,
      acceptButton,
    ],
  );
};
