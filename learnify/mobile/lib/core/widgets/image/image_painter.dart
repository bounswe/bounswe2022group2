import 'dart:ui';

import 'package:flutter/material.dart' hide Image;

///Handles all the painting ongoing on the canvas.
class DrawImage extends CustomPainter {
  ///Constructor for the canvas
  DrawImage(
      {this.image,
      this.update,
      this.points,
      this.isDragging = false,
      this.isSignature = false,
      this.backgroundColor,
      this.paintHistory});

  ///Converted image from [ImagePainter] constructor.
  final Image? image;

  ///Keeps track of all the units of [PaintHistory].
  final List<PaintInfo>? paintHistory;

  ///Keeps track of points on currently drawing state.
  final UpdatePoints? update;

  ///Keeps track of freestyle points on currently drawing state.
  final List<Offset?>? points;

  ///Keeps track whether the paint action is running or not.
  final bool isDragging;

  ///Flag for triggering signature mode.
  final bool isSignature;

  ///The background for signature painting.
  final Color? backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (isSignature) {
      ///Paints background for signature.
      canvas.drawRect(
          Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
          Paint()
            ..style = PaintingStyle.fill
            ..color = backgroundColor!);
    } else {
      ///paints [ui.Image] on the canvas for reference to draw over it.
      paintImage(
        canvas: canvas,
        image: image!,
        filterQuality: FilterQuality.high,
        rect: Rect.fromPoints(
          const Offset(0, 0),
          Offset(size.width, size.height),
        ),
      );
    }

    ///paints all the previoud paintInfo history recorded on [PaintHistory]
    for (final PaintInfo item in paintHistory!) {
      final List<Offset?>? offset = item.offset;
      final Paint? painter = item.painter;
      canvas.drawRect(Rect.fromPoints(offset![0]!, offset[1]!), painter!);
    }

    ///Draws ongoing action on the canvas while indrag.
    if (isDragging) {
      final Offset? start = update!.start;
      final Offset? end = update!.end;
      final Paint? painter = update!.painter;
      canvas.drawRect(Rect.fromPoints(start!, end!), painter!);
    }

    ///Draws all the completed actions of painting on the canvas.
  }

  @override
  bool shouldRepaint(DrawImage oldInfo) =>
      oldInfo.update != update ||
      oldInfo.paintHistory!.length == paintHistory!.length;
}

///All the paint method available for use.

enum PaintMode {
  ///Allows to draw rectangle.
  rect,

  ///Allows to draw rectangle.
  none,
}

///[PaintInfo] keeps track of a single unit of shape, whichever selected.
class PaintInfo {
  ///In case of string, it is used to save string value entered.
  PaintInfo(
      {required this.offset, required this.painter, this.text, this.mode});

  ///Mode of the paint method.
  PaintMode? mode;

  ///Used to save specific paint utils used for the specific shape.
  Paint? painter;

  ///Used to save offsets.
  ///Two point in case of other shapes and list of points for [FreeStyle].
  List<Offset?>? offset;

  ///Used to save text in case of text type.
  String? text;
}

@immutable

///Records realtime updates of ongoing [PaintInfo] when inDrag.
class UpdatePoints {
  ///Constructor for ongoing painthistory.
  const UpdatePoints({this.start, this.end, this.painter, this.mode});

  ///Records the first tap offset,
  final Offset? start;

  ///Records all the offset after first one.
  final Offset? end;

  ///Records [Paint] method of the ongoing painting.
  final Paint? painter;

  ///Records [PaintMode] of the ongoing painting.
  final PaintMode? mode;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UpdatePoints &&
        o.start == start &&
        o.end == end &&
        o.painter == painter &&
        o.mode == mode;
  }

  @override
  int get hashCode =>
      start.hashCode ^ end.hashCode ^ painter.hashCode ^ mode.hashCode;
}
