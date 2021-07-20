import 'package:flutter/material.dart';

typedef Widget ButtonBuilder({
  required VoidCallback? onPressed,
  required Widget child,
});

ButtonBuilder defaultPrimaryButtonBuilder = ({
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
};

ButtonBuilder defaultSecondaryButtonBuilder = ({
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
};
