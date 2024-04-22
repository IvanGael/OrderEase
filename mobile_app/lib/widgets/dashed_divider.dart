import 'package:flutter/material.dart';
import 'package:orderease/constants/colors.dart';

class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1, 
      child: CustomPaint(
        painter: DashedDividerPainter(),
      ),
    );
  }
}

class DashedDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.color2 
      ..strokeWidth = 1.0 
      ..strokeCap = StrokeCap.round; 

    double dashWidth = 5.0;
    double dashSpace = 5.0;
    double startY = 0.0;
    double endY = size.height;

    double currentX = 0.0;

    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
