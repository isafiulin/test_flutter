import 'package:flutter/material.dart';
import 'package:test_shop_app/config/style/global_app_colors_style.dart';

class BluePainter extends CustomPainter {
  Size deviceSize;
  BluePainter({
    required this.deviceSize,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final height = deviceSize.height;
    final width = deviceSize.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = AppColors.background;

    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(-100, 0);
    //rebuild into non manual
    ovalPath.quadraticBezierTo(-200, height * 0.78, height + 25, 0);
    paint.color = AppColors.primary;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class AuthPagePainter extends CustomPainter {
  Size deviceSize;
  AuthPagePainter({
    required this.deviceSize,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final height = deviceSize.height;
    final width = deviceSize.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = AppColors.primary;

    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.2);
    //rebuild into non manual
    ovalPath.quadraticBezierTo(
      width * 0.45,
      height * 0.25,
      width * 0.51,
      height * 0.5,
    );

    ovalPath.quadraticBezierTo(
      width * 0.58,
      height * 0.8,
      width * 0.1,
      height,
    );
    ovalPath.lineTo(0, height);
    ovalPath.close();

    paint.color = Colors.blue.shade200;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
