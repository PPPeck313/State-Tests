import 'package:flutter/widgets.dart';

extension EdgeInsetsGeometryExtension on EdgeInsetsGeometry {
  String get paddingString => switch (this) {
    EdgeInsets eI => '${eI.top}, ${eI.right}, ${eI.bottom}, ${eI.left}',
    EdgeInsets.symmetric => 'Symmetric: $vertical (Vertical), $horizontal (Horizontal)',
    _ => 'Custom padding',
  };
}
