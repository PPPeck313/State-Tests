import 'package:flutter/material.dart';

typedef WidgetTransform = Widget Function(Widget widget);

class WidgetTransformer {
  final WidgetTransform transform;

  WidgetTransformer({required this.transform});

  Widget run(Widget widget) => _transformWidget(widget);

  Widget _transformWidget(Widget widget) {
    Widget transformed = transform(widget);

    // Then check if it's a container with children and recursively transform
    if (transformed is SingleChildRenderObjectWidget && transformed.child != null) {
      return transformed is Padding
          ? transformed // Already replaced Padding? Leave it.
          : transformed.runtimeType == Container
          ? Container(key: transformed.key, child: _transformWidget(transformed.child!))
          : transformed;
    } else if (transformed is MultiChildRenderObjectWidget) {
      if (transformed is Column || transformed is Row) {
        return Flex(
          direction: (transformed as Flex).direction,
          key: transformed.key,
          mainAxisAlignment: transformed.mainAxisAlignment,
          crossAxisAlignment: transformed.crossAxisAlignment,
          children: transformed.children.map(_transformWidget).toList(),
        );
      }
    }

    return transformed;
  }
}
