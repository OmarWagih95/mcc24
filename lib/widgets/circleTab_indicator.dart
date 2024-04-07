import 'package:flutter/material.dart';

class CircleIndicator extends Decoration {
  final Color color;
  double radius;
  CircleIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return boxPainter(color: color, radius: radius);
  }
}

class boxPainter extends BoxPainter {
  final Color color;
  double radius;

  boxPainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}

void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
  final Rect rect = Offset(
        offset.dx,
        configuration.size!.height - 2, // Adjust indicator height
      ) &
      Size(configuration.size!.width, 2); // Set indicator width and height

  final Paint paint = Paint()
    ..color = Colors.yellow // Set indicator color
    ..style = PaintingStyle.fill;

  canvas.drawRect(rect, paint); // Draw the rectangular indicator
}
