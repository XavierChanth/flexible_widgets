import 'package:flutter/material.dart';
import 'library_widgets/index.dart';

// * This code would be part of the new library created as a parent
// * to manage other libraries

class AtWidgetPreference {
  AtWidgetPreference({TextButtonBuilder? textButton})
      : _textButton = textButton ?? defaultTextButtonBuilder;

  TextButtonBuilder _textButton;
  set textButton(TextButtonBuilder widget) => _textButton = widget;

  Map<String, Function> get widgets => {
        'text-button': _textButton,
      };

  Function? operator [](String key) => widgets[key];
}

abstract class AtWidgetsLayoutBuilder extends StatelessWidget {
  AtWidgetsLayoutBuilder(
      {required Map<String, dynamic> layout,
      AtWidgetPreference? preference,
      Key? key})
      : layout = layout,
        preference = preference ?? AtWidgetPreference(),
        super(key: key);

  final Map<String, dynamic> layout;
  final AtWidgetPreference preference;

  Map<String, Function> get functions;
  Map<String, Function> get widgets;

  Widget buildLayout(dynamic layout) {
    if (layout is Widget) {
      return layout;
    }
    if (layout['widget'] == 'column') {
      print(List.from(layout['children']));
      return Column(
        children: List.from(layout['children'])
            .map((childLayout) => buildLayout(childLayout))
            .toList(),
        //TODO props
      );
    }
    if (layout['widget'] == 'row') {
      return Row(
        children: List.from(layout['children'])
            .map((childLayout) => buildLayout(childLayout))
            .toList(),
        //TODO props
      );
    }
    if (widgets.containsKey(layout['widget'])) {
      return widgets[layout['widget']]!(
        layout['child'],
        //TODO props
      );
    }

    Function? f = preference[layout['widget']];
    Widget result = Container();
    if (f != null) {
      result = f(
        child: buildLayout(layout['child']),
        onPressed: functions[layout['onPressed']],
        //TODO props
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(layout);
  }
}
