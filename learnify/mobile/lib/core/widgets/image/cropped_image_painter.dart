import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CroppedImagePainter extends CustomPainter {
  CroppedImagePainter(this.resImage, this.rectCrop);
  ui.Image? resImage;

  Rect rectCrop;

  @override
  void paint(Canvas canvas, Size size) {
    if (resImage?.width == null || resImage?.height == null) return;
    final Rect rect = Offset.zero & size;
    final Size imageSize =
        Size(resImage!.width.toDouble(), resImage!.height.toDouble());
    final FittedSizes sizes = applyBoxFit(BoxFit.fitWidth, imageSize, size);

    final Rect inputSubRect = rectCrop;
    final Rect outputSubRect =
        Alignment.center.inscribe(sizes.destination, rect);

    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas
      ..drawRect(rect, paint)
      ..drawImageRect(resImage!, inputSubRect, outputSubRect, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
