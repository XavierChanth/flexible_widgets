import 'package:flexible_widgets/test2/child_lib/layout_builder.dart';
import 'package:flexible_widgets/test2/parent_lib/parent_library.dart';
import 'package:flexible_widgets/test2/parent_lib/button_builder.dart';
import 'package:flutter/widgets.dart';

export 'package:flexible_widgets/test2/parent_lib/parent_library.dart';
export 'package:flexible_widgets/test2/parent_lib/button_builder.dart';

// * New Mixin that separates the logic from the UI
mixin ChildLibrary1Preference on AtWidgetPreference {
  initializeChildLibrary1() {
    widgets['accept'] ??= defaultAcceptButtonBuilder;
    widgets['cancel'] ??= defaultCancelButtonBuilder;
  }

  late Function childLibrarySetState;
  ChildLibrary1LayoutBuilder? _childLibrary1Layout;
  set layout(ChildLibrary1LayoutBuilder layout) =>
      _childLibrary1Layout = layout;

  set acceptButton(ButtonBuilder value) => widgets['accept'] = value;
  set cancelButton(ButtonBuilder value) => widgets['cancel'] = value;

  void Function(VoidCallback doStuff) setChildLibraryState =
      (doStuff) => doStuff();
  int childLibraryCounter = 0;

  Widget buildChildLibrary1Layout(
      void Function(VoidCallback doStuff) setState) {
    this.setChildLibraryState = setState;
    this.initializeChildLibrary1();
    ChildLibrary1LayoutBuilder builder =
        _childLibrary1Layout ?? defaultChildLibrary1LayoutBuilder;
    return builder(
      (widgets['cancel'] as ButtonBuilder)(
        child: Text('Cancel'),
        onPressed: () {
          print('Child library cancel logic');
        },
      ),
      (widgets['accept'] as ButtonBuilder)(
        child: Text(childLibraryCounter.toString()),
        onPressed: () {
          setState(() {
            childLibraryCounter += 1;
          });
          print('Child library accept logic');
        },
      ),
    );
  }
}

class _DefaultPreference extends AtWidgetPreference
    with ChildLibrary1Preference {}

//* Below is existing code

class MyLibraryScreen extends StatefulWidget {
  MyLibraryScreen({ChildLibrary1Preference? preference, Key? key})
      : _preference = preference ?? _DefaultPreference(),
        super(key: key);
  final ChildLibrary1Preference _preference;
  @override
  _MyLibraryScreenState createState() => _MyLibraryScreenState(_preference);
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  ChildLibrary1Preference preference;
  _MyLibraryScreenState(this.preference);

  @override
  Widget build(BuildContext context) {
    return preference.buildChildLibrary1Layout(setState);
  }
}
