/// This code is inspired by and integrated from the following repository:
/// https://github.com/yellowQ-software/yellowQ-Flutter-Image-Painter
/// This code just integrates the features in the given repository into
/// our project and configures the required places to allow more functionality.
/// Given repository doesn't have anything related to the annotations.
/// We implemented and integrated annotation feature ourselves.
///
import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide Image;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../../features/learning-space/models/annotation/annotation_model.dart';
import '../../constants/main_type_definitions.dart';
import '../../helpers/color_helpers.dart';
import '../dialog/dialog_builder.dart';
import 'image_painter.dart';
import 'ported_interactive_viewer.dart';

///[AnnotatableImage] widget.
@immutable
class AnnotatableImage extends StatefulWidget {
  const AnnotatableImage({
    required this.annotateCallback,
    Key? key,
    this.assetPath,
    this.networkUrl,
    this.byteArray,
    this.file,
    this.height,
    this.width,
    this.placeHolder,
    this.isScalable,
    this.brushIcon,
    this.clearAllIcon,
    this.colorIcon,
    this.undoIcon,
    this.isSignature = false,
    this.controlsAtTop = true,
    this.signatureBackgroundColor,
    this.colors,
    this.initialPaintMode,
    this.initialStrokeWidth,
    this.initialColor,
    this.onColorChanged,
    this.onStrokeWidthChanged,
    this.onPaintModeChanged,
    this.clickable = false,
    this.paintHistory = const <PaintInfo>[],
  }) : super(key: key);

  ///Constructor for loading image from assetPath.
  factory AnnotatableImage.asset(
    String path, {
    required AnnotateImageCallback annotateCallback,
    required Key key,
    double? height,
    double? width,
    bool? scalable,
    Widget? placeholderWidget,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    bool? controlsAtTop,
  }) =>
      AnnotatableImage(
        key: key,
        assetPath: path,
        height: height,
        width: width,
        isScalable: scalable ?? false,
        placeHolder: placeholderWidget,
        colors: colors,
        brushIcon: brushIcon,
        undoIcon: undoIcon,
        colorIcon: colorIcon,
        clearAllIcon: clearAllIcon,
        initialPaintMode: initialPaintMode,
        initialColor: initialColor,
        initialStrokeWidth: initialStrokeWidth,
        onPaintModeChanged: onPaintModeChanged,
        onColorChanged: onColorChanged,
        onStrokeWidthChanged: onStrokeWidthChanged,
        controlsAtTop: controlsAtTop ?? true,
        annotateCallback: annotateCallback,
      );

  ///Constructor for loading image from [File].
  factory AnnotatableImage.file(
    File file, {
    required AnnotateImageCallback annotateCallback,
    required Key key,
    double? height,
    double? width,
    bool? scalable,
    Widget? placeholderWidget,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    bool? controlsAtTop,
  }) =>
      AnnotatableImage(
        key: key,
        file: file,
        height: height,
        width: width,
        placeHolder: placeholderWidget,
        colors: colors,
        isScalable: scalable ?? false,
        brushIcon: brushIcon,
        undoIcon: undoIcon,
        colorIcon: colorIcon,
        clearAllIcon: clearAllIcon,
        initialPaintMode: initialPaintMode,
        initialColor: initialColor,
        initialStrokeWidth: initialStrokeWidth,
        onPaintModeChanged: onPaintModeChanged,
        onColorChanged: onColorChanged,
        onStrokeWidthChanged: onStrokeWidthChanged,
        controlsAtTop: controlsAtTop ?? true,
        annotateCallback: annotateCallback,
      );

  ///Constructor for loading image from memory.
  factory AnnotatableImage.memory(
    Uint8List byteArray, {
    required AnnotateImageCallback annotateCallback,
    required Key key,
    double? height,
    double? width,
    bool? scalable,
    Widget? placeholderWidget,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    PaintMode? initialPaintMode,
    double? initialStrokeWidth,
    Color? initialColor,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    bool? controlsAtTop,
  }) =>
      AnnotatableImage(
        key: key,
        byteArray: byteArray,
        height: height,
        width: width,
        placeHolder: placeholderWidget,
        isScalable: scalable ?? false,
        colors: colors,
        brushIcon: brushIcon,
        undoIcon: undoIcon,
        colorIcon: colorIcon,
        clearAllIcon: clearAllIcon,
        initialPaintMode: initialPaintMode,
        initialColor: initialColor,
        initialStrokeWidth: initialStrokeWidth,
        onPaintModeChanged: onPaintModeChanged,
        onColorChanged: onColorChanged,
        onStrokeWidthChanged: onStrokeWidthChanged,
        controlsAtTop: controlsAtTop ?? true,
        annotateCallback: annotateCallback,
      );

  ///Constructor for signature painting.
  factory AnnotatableImage.signature({
    required Key key,
    required AnnotateImageCallback annotateCallback,
    Color? signatureBgColor,
    double? height,
    double? width,
    List<Color>? colors,
    Widget? brushIcon,
    Widget? undoIcon,
    Widget? clearAllIcon,
    Widget? colorIcon,
    ValueChanged<PaintMode>? onPaintModeChanged,
    ValueChanged<Color>? onColorChanged,
    ValueChanged<double>? onStrokeWidthChanged,
    bool? controlsAtTop,
  }) =>
      AnnotatableImage(
        key: key,
        height: height,
        width: width,
        isSignature: true,
        isScalable: false,
        colors: colors,
        signatureBackgroundColor: signatureBgColor ?? Colors.white,
        brushIcon: brushIcon,
        undoIcon: undoIcon,
        colorIcon: colorIcon,
        clearAllIcon: clearAllIcon,
        onPaintModeChanged: onPaintModeChanged,
        onColorChanged: onColorChanged,
        onStrokeWidthChanged: onStrokeWidthChanged,
        controlsAtTop: controlsAtTop ?? true,
        annotateCallback: annotateCallback,
      );

  ///Only accessible through [AnnotatableImage.network] constructor.
  final String? networkUrl;

  ///Only accessible through [AnnotatableImage.memory] constructor.
  final Uint8List? byteArray;

  ///Only accessible through [AnnotatableImage.file] constructor.
  final File? file;

  ///Only accessible through [AnnotatableImage.asset] constructor.
  final String? assetPath;

  ///Height of the Widget. Image is subjected to fit within the given height.
  final double? height;

  ///Width of the widget. Image is subjected to fit within the given width.
  final double? width;

  ///Widget to be shown during the conversion of provided image to [ui.Image].
  final Widget? placeHolder;

  ///Defines whether the widget should be scaled or not. Defaults to [false].
  final bool? isScalable;

  ///Flag to determine signature or image;
  final bool isSignature;

  ///Signature mode background color
  final Color? signatureBackgroundColor;

  ///List of colors for color selection
  ///If not provided, default colors are used.
  final List<Color>? colors;

  ///Icon Widget of strokeWidth.
  final Widget? brushIcon;

  ///Widget of Color Icon in control bar.
  final Widget? colorIcon;

  ///Widget for Undo last action on control bar.
  final Widget? undoIcon;

  ///Widget for clearing all actions on control bar.
  final Widget? clearAllIcon;

  ///Define where the controls is located.
  ///`true` represents top.
  final bool controlsAtTop;

  ///Initial PaintMode.
  final PaintMode? initialPaintMode;

  //the initial stroke width
  final double? initialStrokeWidth;

  //the initial color
  final Color? initialColor;

  final ValueChanged<Color>? onColorChanged;

  final ValueChanged<double>? onStrokeWidthChanged;

  final ValueChanged<PaintMode>? onPaintModeChanged;
  final List<PaintInfo> paintHistory;

  final AnnotateImageCallback annotateCallback;
  final bool clickable;

  @override
  AnnotatableImageState createState() => AnnotatableImageState();
}

///
class AnnotatableImageState extends State<AnnotatableImage> {
  final GlobalKey<State<StatefulWidget>> _repaintKey = GlobalKey();
  ui.Image? _image;
  bool _inDrag = false;
  List<PaintInfo> _paintHistory = <PaintInfo>[];
  final List<ui.Offset?> _points = <Offset?>[];
  late final ValueNotifier<Controller> _controller;
  late final ValueNotifier<bool> _isLoaded;
  late final TextEditingController _textController;
  Offset? _start, _end;
  Color _randColor = ColorHelpers.randomColor;
  int _strokeMultiplier = 1;

  @override
  void initState() {
    super.initState();
    _isLoaded = ValueNotifier<bool>(false);
    _paintHistory = widget.paintHistory;
    _resolveAndConvertImage();
    if (widget.isSignature) {
      _controller = ValueNotifier(const Controller(color: Colors.black));
    } else {
      _controller = ValueNotifier(const Controller().copyWith(
          mode: widget.initialPaintMode,
          strokeWidth: widget.initialStrokeWidth,
          color: widget.initialColor));
    }
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _isLoaded.dispose();
    _textController.dispose();
    super.dispose();
  }

  Paint get _painter => Paint()
    ..color = _randColor
    ..strokeWidth = _controller.value.strokeWidth * _strokeMultiplier
    ..style = _controller.value.paintStyle;

  bool get isEdited => _paintHistory.isNotEmpty;

  ///Converts the incoming image type from constructor to [ui.Image]
  Future<void> _resolveAndConvertImage() async {
    if (widget.networkUrl != null) {
      _image = await _loadNetworkImage(widget.networkUrl!);
      if (_image == null) {
        throw "${widget.networkUrl} couldn't be resolved.";
      } else {
        _setStrokeMultiplier();
      }
    } else if (widget.assetPath != null) {
      final ByteData img = await rootBundle.load(widget.assetPath!);
      _image = await _convertImage(Uint8List.view(img.buffer));
      if (_image == null) {
        throw "${widget.assetPath} couldn't be resolved.";
      } else {
        _setStrokeMultiplier();
      }
    } else if (widget.file != null) {
      final Uint8List img = await widget.file!.readAsBytes();
      _image = await _convertImage(img);
      if (_image == null) {
        throw "Image couldn't be resolved from provided file.";
      } else {
        _setStrokeMultiplier();
      }
    } else if (widget.byteArray != null) {
      _image = await _convertImage(widget.byteArray!);
      if (_image == null) {
        throw "Image couldn't be resolved from provided byteArray.";
      } else {
        _setStrokeMultiplier();
      }
    } else {
      _isLoaded.value = true;
    }
  }

  ///Dynamically sets stroke multiplier on the basis of widget size.
  ///Implemented to avoid thin stroke on high res images.
  _setStrokeMultiplier() {
    if ((_image!.height + _image!.width) > 1000) {
      _strokeMultiplier = (_image!.height + _image!.width) ~/ 1000;
    }
  }

  ///Completer function to convert asset or file image to [ui.Image] before drawing on custompainter.
  Future<ui.Image> _convertImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    ui.decodeImageFromList(img, (ui.Image image) {
      _isLoaded.value = true;
      return completer.complete(image);
    });
    return completer.future;
  }

  ///Completer function to convert network image to [ui.Image] before drawing on custompainter.
  Future<ui.Image> _loadNetworkImage(String path) async {
    final Completer<ImageInfo> completer = Completer<ImageInfo>();
    final NetworkImage img = NetworkImage(path);
    img.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo info, _) => completer.complete(info)));
    final ImageInfo imageInfo = await completer.future;
    _isLoaded.value = true;
    return imageInfo.image;
  }

  Future<void> onTapDown(BuildContext context, TapDownDetails details) async {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) return;
    final Offset localOffset = box.globalToLocal(details.globalPosition);
    final List<Annotation> clickedAnnotations = <Annotation>[];
    for (int i = 0; i < _paintHistory.length; i++) {
      final PaintInfo info = _paintHistory[i];
      if (info.offset == null || info.offset!.length < 2) continue;
      final Offset start = info.offset![0] ?? Offset.zero;
      final Offset end = info.offset![1] ?? Offset.zero;
      if (Rect.fromPoints(start, end).contains(localOffset)) {
        clickedAnnotations.add(info.annotation);
      }
    }
    if (clickedAnnotations.isEmpty) return;
    String annotations = '';
    for (int i = 0; i < clickedAnnotations.length; i++) {
      // ignore: use_string_buffers
      annotations += '${clickedAnnotations[i].content ?? ''}\n';
    }
    await DialogBuilder(context)
        .textDialog(annotations, 'Clicked Annotation:', translateTitle: false);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _isLoaded,
        builder: (_, bool loaded, __) {
          if (loaded) {
            return widget.isSignature ? _paintSignature() : _paintImage();
          } else {
            return SizedBox(
              height: widget.height ?? double.maxFinite,
              width: widget.width ?? double.maxFinite,
              child: Center(
                child: widget.placeHolder ?? const CircularProgressIndicator(),
              ),
            );
          }
        },
      );

  ///paints image on given constrains for drawing if image is not null.
  Widget _paintImage() => SizedBox(
        height: widget.height ?? double.maxFinite,
        width: widget.width ?? double.maxFinite,
        child: FittedBox(
          alignment: FractionalOffset.center,
          child: ClipRect(
            child: ValueListenableBuilder<Controller>(
              valueListenable: _controller,
              builder: (BuildContext context, Controller controller, __) {
                final CustomPaint image = CustomPaint(
                  size:
                      Size(_image!.width.toDouble(), _image!.height.toDouble()),
                  willChange: true,
                  isComplex: true,
                  painter: DrawImage(
                    image: _image,
                    points: _points,
                    paintHistory: _paintHistory,
                    isDragging: _inDrag,
                    update: UpdatePoints(
                        start: _start,
                        end: _end,
                        painter: _painter,
                        mode: controller.mode),
                  ),
                );
                return ImagePainterTransformer(
                  maxScale: 2.4,
                  minScale: 1,
                  panEnabled: false,
                  scaleEnabled: widget.isScalable!,
                  onInteractionUpdate: (ScaleUpdateDetails details) =>
                      _scaleUpdateGesture(details, controller),
                  onInteractionEnd: (ScaleEndDetails details) =>
                      _scaleEndGesture(details, controller),
                  child: widget.clickable
                      ? GestureDetector(
                          onTapDown: (TapDownDetails details) =>
                              onTapDown(context, details),
                          child: image)
                      : image,
                );
              },
            ),
          ),
        ),
      );

  Widget _paintSignature() => Stack(
        children: [
          RepaintBoundary(
            key: _repaintKey,
            child: ClipRect(
              child: SizedBox(
                width: widget.width ?? double.maxFinite,
                height: widget.height ?? double.maxFinite,
                child: ValueListenableBuilder<Controller>(
                  valueListenable: _controller,
                  builder: (_, Controller controller, __) =>
                      ImagePainterTransformer(
                    panEnabled: false,
                    scaleEnabled: false,
                    onInteractionStart: _scaleStartGesture,
                    onInteractionUpdate: (ScaleUpdateDetails details) =>
                        _scaleUpdateGesture(details, controller),
                    onInteractionEnd: (ScaleEndDetails details) =>
                        _scaleEndGesture(details, controller),
                    child: CustomPaint(
                      willChange: true,
                      isComplex: true,
                      painter: DrawImage(
                        isSignature: true,
                        backgroundColor: widget.signatureBackgroundColor,
                        points: _points,
                        paintHistory: _paintHistory,
                        isDragging: _inDrag,
                        update: UpdatePoints(
                            start: _start,
                            end: _end,
                            painter: _painter,
                            mode: controller.mode),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: widget.clearAllIcon ??
                      Icon(Icons.clear, color: Colors.grey[700]),
                  onPressed: () => setState(_paintHistory.clear),
                ),
              ],
            ),
          ),
        ],
      );

  _scaleStartGesture(ScaleStartDetails onStart) {
    if (!widget.isSignature) {
      setState(() {
        _start = onStart.focalPoint;
        _points.add(_start);
      });
    }
  }

  ///Fires while user is interacting with the screen to record painting.
  void _scaleUpdateGesture(ScaleUpdateDetails onUpdate, Controller ctrl) {
    if (widget.initialPaintMode == PaintMode.none) return;
    setState(
      () {
        _inDrag = true;
        _start ??= onUpdate.focalPoint;
        _end = onUpdate.focalPoint;
      },
    );
  }

  ///Fires when user stops interacting with the screen.
  Future<void> _scaleEndGesture(
      ScaleEndDetails onEnd, Controller controller) async {
    if (widget.initialPaintMode == PaintMode.none) return;
    if (_start != null && _end != null) {
      await _addEndPoints();
    }
    setState(() {
      _inDrag = false;
      _start = null;
      _end = null;
    });
  }

  Future<void> _addEndPoints() async {
    if (_start == null || _end == null) return;
    final Annotation? res =
        await widget.annotateCallback(_start!, _end!, _painter.color);
    if (res == null) return;
    _addPaintHistory(
      PaintInfo(
        annotation: res,
        offset: <Offset?>[_start, _end],
        painter: _painter,
        mode: _controller.value.mode,
      ),
    );
    _randColor = ColorHelpers.randomColor;
  }

  ///Provides [ui.Image] of the recorded canvas to perform action.
  Future<ui.Image> _renderImage() async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final ui.Canvas canvas = Canvas(recorder);
    final DrawImage painter =
        DrawImage(image: _image, paintHistory: _paintHistory);
    final ui.Size size =
        Size(_image!.width.toDouble(), _image!.height.toDouble());
    painter.paint(canvas, size);
    return recorder
        .endRecording()
        .toImage(size.width.floor(), size.height.floor());
  }

  ///Generates [Uint8List] of the [ui.Image] generated by the [renderImage()] method.
  ///Can be converted to image file by writing as bytes.
  Future<Uint8List?> exportImage() async {
    late ui.Image convertedImage;
    if (widget.isSignature) {
      final RenderRepaintBoundary boundary = _repaintKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      convertedImage = await boundary.toImage(pixelRatio: 3);
    } else if (widget.byteArray != null && _paintHistory.isEmpty) {
      return widget.byteArray;
    } else {
      convertedImage = await _renderImage();
    }
    final ByteData? byteData =
        await convertedImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  void _addPaintHistory(PaintInfo info) {
    _paintHistory.add(info);
  }
}

///Gives access to manipulate the essential components like [strokeWidth], [Color] and [PaintMode].
@immutable
class Controller {
  ///Constructor of the [Controller] class.
  const Controller(
      {this.strokeWidth = 4.0,
      this.color = Colors.red,
      this.mode = PaintMode.rect,
      this.paintStyle = PaintingStyle.stroke,
      this.text = ""});

  ///Tracks [strokeWidth] of the [Paint] method.
  final double strokeWidth;

  ///Tracks [Color] of the [Paint] method.
  final Color color;

  ///Tracks [PaintingStyle] of the [Paint] method.
  final PaintingStyle paintStyle;

  ///Tracks [PaintMode] of the current [Paint] method.
  final PaintMode mode;

  ///Any text.
  final String text;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Controller &&
        o.strokeWidth == strokeWidth &&
        o.color == color &&
        o.paintStyle == paintStyle &&
        o.mode == mode &&
        o.text == text;
  }

  @override
  int get hashCode =>
      strokeWidth.hashCode ^
      color.hashCode ^
      paintStyle.hashCode ^
      mode.hashCode ^
      text.hashCode;

  ///copyWith Method to access immutable controller.
  Controller copyWith(
          {double? strokeWidth,
          Color? color,
          PaintMode? mode,
          PaintingStyle? paintingStyle,
          String? text}) =>
      Controller(
          strokeWidth: strokeWidth ?? this.strokeWidth,
          color: color ?? this.color,
          mode: mode ?? this.mode,
          paintStyle: paintingStyle ?? paintStyle,
          text: text ?? this.text);
}
