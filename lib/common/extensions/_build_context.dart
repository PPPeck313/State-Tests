import 'package:flutter/material.dart';
import 'package:state_tests/common/extensions/_string.dart';

String _printWidgetTree(BuildContext context, PrintOptions printOptions) {
  final StringBuffer buffer = StringBuffer()..writeln('Widget Tree:');
  _printNodes(buffer, context as Element, 0, printOptions);
  return buffer.toString();
}

String _printWidgetSubtree(BuildContext context, bool Function(Type type) matcher, PrintOptions printOptions) {
  final StringBuffer buffer = StringBuffer();
  Element? targetElement = _findElement(context as Element, matcher);
  targetElement == null ? buffer.write('Widget not found.') : _printNodes(buffer, targetElement, 0, printOptions);
  return buffer.toString();
}

Element? _findElement(Element element, bool Function(Type type) matcher) {
  if (matcher(element.widget.runtimeType)) return element;

  Element? matchedElement;
  element.visitChildren((child) => matchedElement ??= _findElement(child, matcher));
  return matchedElement;
}

void _printNodes(StringBuffer buffer, Element element, int depth, PrintOptions printOptions) {
  bool isFiltered = printOptions.filterMatcher?.call(element.widget.runtimeType) == true;
  if (!isFiltered) _printNode(buffer, element, depth, printOptions.detailedMode);

  if (printOptions.truncateMatcher?.call(element.widget.runtimeType) == false) {
    element.visitChildren((Element child) {
      _printNodes(buffer, child, depth + (isFiltered ? 0 : 1), printOptions);
    });
  }
}

void _printNode(StringBuffer buffer, Element element, int depth, bool detailedMode) {
  String tab = ' ';
  String indent = tab * (depth - 1);

  String depthNumber = depth > 0 ? '$depth.' : '';
  String depthLine = detailedMode ? '$indent$depthNumber'.replaceAll(' ', '—') : '$indent$depthNumber';

  String detailedNode = '$depthLine${element.widget.toString()}';
  String adjustedNode = detailedMode ? detailedNode.toDetailedWidget(indent, tab) : detailedNode.toSimpleWidget;

  buffer.writeln(adjustedNode);
}

extension BuildContextExtensions on BuildContext {
  String print({bool Function(Type type)? matcher, PrintOptions printOptions = const PrintOptions()}) =>
      matcher == null ? _printWidgetTree(this, printOptions) : _printWidgetSubtree(this, matcher, printOptions);
}

class NodeMatchers {
  static bool Function(Type) get stateMatcher => (type) => type.toString().contains('_');
}

class PrintOptions {
  final bool detailedMode;
  final bool Function(Type type)? filterMatcher;
  final bool Function(Type type)? truncateMatcher;

  const PrintOptions({this.detailedMode = false, this.filterMatcher, this.truncateMatcher});
}
