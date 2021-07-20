import 'button_builder.dart';
export 'button_builder.dart';

class AtWidgetPreference {
  ButtonBuilder? _primaryButtonBuilder;
  ButtonBuilder? _secondaryButtonBuilder;
  // * Other widget builders ...

  set primaryButtonBuilder(ButtonBuilder builder) =>
      _primaryButtonBuilder = builder;
  set secondaryButtonBuilder(ButtonBuilder builder) =>
      _secondaryButtonBuilder = builder;

  ButtonBuilder get primaryButtonBuilder =>
      _primaryButtonBuilder ?? defaultPrimaryButtonBuilder;
  ButtonBuilder get secondaryButtonBuilder =>
      _secondaryButtonBuilder ?? defaultSecondaryButtonBuilder;
}
