import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:state_tests/common/extensions/_string.dart';
import 'package:state_tests/common/widgets/debug/debug_manager.dart';

part 'debug_padding.g.dart';

class MyPadding extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;

  const MyPadding({super.key, required this.padding, this.child});

  @override
  Widget build(BuildContext context) =>
      DebugManager().isDebugEnabled
          ? DebugPadding(padding: padding as EdgeInsets, child: child)
          : Padding(padding: padding, child: child);
}

@swidget
Widget debugPadding({required EdgeInsets padding, Widget? child}) => Container(
  decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2)),
  child: Stack(
    children: [
      PaddingText(Up(padding.top)),
      PaddingText(Down(padding.bottom)),
      PaddingText(Left(padding.left)),
      PaddingText(Right(padding.right)),
      Container(
        padding: padding,
        child: Container(color: Colors.red.withOpacity(0.1), child: child ?? SizedBox.shrink()),
      ),
    ],
  ),
);

@swidget
Widget paddingText(DirectionType direction) =>
    direction.padding > 0
        ? Positioned(
          top: direction is Down ? null : 0,
          bottom: direction is Up ? null : 0,
          left: direction is Right ? null : 0,
          right: direction is Left ? null : 0,
          child: Center(
            child: Text(
              '${direction.leftArrow}${direction.padding}${direction.rightArrow}',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12, height: 1.0),
            ),
          ),
        )
        : SizedBox.shrink();

sealed class DirectionType {
  final double padding;

  final String arrowCode;
  String get leftArrow => this is! Right ? arrowCode.decodeUnicode : '';
  String get rightArrow => this is Right ? arrowCode.decodeUnicode : '';

  const DirectionType(this.padding, this.arrowCode);
}

final class Up extends DirectionType {
  Up(double padding) : super(padding, '02191');
}

final class Down extends DirectionType {
  Down(double padding) : super(padding, '02193');
}

final class Right extends DirectionType {
  Right(double padding) : super(padding, '02192');
}

final class Left extends DirectionType {
  Left(double padding) : super(padding, '02190');
}
