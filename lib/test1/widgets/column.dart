import 'package:flutter/material.dart';

typedef Widget ColumnBuilder({List<Widget>? children, void Function()? onPressed});

Widget defaultTextButtonBuilder({required Widget child, void Function()? onPressed}) {
  return TextButton(
    child: child,
    onPressed: onPressed,
  );
}

Widget defaultTextButtonBuilderWithContext(
    {required Widget child, void Function()? onPressed}) {
  return Builder(
    builder: (BuildContext context) {
      return TextButton(
        child: child,
        onPressed: onPressed ??
            () {
              Navigator.of(context).pushNamed('');
            },
      );
    },
  );
}
