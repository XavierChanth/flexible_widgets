import 'package:flutter/material.dart';

// * Works for TextButton, ElevatedButton, OutlinedButton

typedef Widget ButtonBuilder({
  required VoidCallback? onPressed,
  required Widget child,
});

Widget defaultAcceptButtonBuilder({
  required Widget child,
  required VoidCallback? onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    child: child,
  );
}

Widget defaultCancelButtonBuilder({
  required Widget child,
  required VoidCallback? onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    ),
    child: child,
  );
}
