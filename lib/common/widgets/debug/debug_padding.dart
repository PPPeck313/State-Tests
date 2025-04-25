import 'package:flutter/material.dart';

class DebugPadding extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  final Color color;

  const DebugPadding({super.key, required this.padding, required this.child, this.color = Colors.redAccent});

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Padding(padding: padding, child: child),
      Positioned.fill(
        child: IgnorePointer(child: CustomPaint(painter: _DebugPaddingPainter(padding: padding, color: color))),
      ),
    ],
  );
}

class _DebugPaddingPainter extends CustomPainter {
  final EdgeInsets padding;
  final Color color;
  final TextStyle textStyle = const TextStyle(fontSize: 12, color: Colors.white, backgroundColor: Colors.black87);

  _DebugPaddingPainter({required this.padding, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color.withOpacity(0.3)
          ..style = PaintingStyle.fill;

    // Top
    if (padding.top > 0) {
      canvas.drawRect(Rect.fromLTWH(0, 0, size.width, padding.top), paint);
      _drawText(canvas, 'top: ${padding.top}', Offset(5, 2));
    }

    // Bottom
    if (padding.bottom > 0) {
      canvas.drawRect(Rect.fromLTWH(0, size.height - padding.bottom, size.width, padding.bottom), paint);
      _drawText(canvas, 'bottom: ${padding.bottom}', Offset(5, size.height - padding.bottom + 2));
    }

    // Left
    if (padding.left > 0) {
      canvas.drawRect(Rect.fromLTWH(0, 0, padding.left, size.height), paint);
      _drawText(canvas, 'left: ${padding.left}', Offset(2, size.height / 2 - 6));
    }

    // Right
    if (padding.right > 0) {
      canvas.drawRect(Rect.fromLTWH(size.width - padding.right, 0, padding.right, size.height), paint);
      _drawText(canvas, 'right: ${padding.right}', Offset(size.width - padding.right + 2, size.height / 2 - 6));
    }
  }

  void _drawText(Canvas canvas, String text, Offset offset) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    textPainter.layout();
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
