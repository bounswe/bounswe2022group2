import 'package:flutter/material.dart';

import '../../../../../core/base/model/base_model.dart';
import '../../../../core/helpers/color_helpers.dart';

// ignore: must_be_immutable
class Annotation extends BaseModel<Annotation> {
  Annotation({
    this.id,
    this.courseId,
    this.categoryId,
    this.postId,
    this.startIndex = 0,
    this.endIndex = 0,
    this.startOffset = Offset.zero,
    this.endOffset = Offset.zero,
    this.upVote,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.isAnnotation = true,
    this.isImage = false,
    this.colorParam,
    this.imageUrl,
    this.creator,
  });

  factory Annotation.dummy(
    int id, {
    int? startIndex,
    int? endIndex,
    Offset? startOffset,
    Offset? endOffset,
    bool? isImage,
    String? imageUrl,
    String? creator,
  }) =>
      Annotation(
        id: id.toString(),
        courseId: id.toString(),
        categoryId: id.toString(),
        postId: id.toString(),
        startIndex: startIndex ?? 12,
        endIndex: endIndex ?? 26,
        upVote: 2,
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
        startOffset: startOffset ?? const Offset(71.9, 258.2),
        endOffset: endOffset ?? const Offset(284.5, 337.3),
        isImage: isImage ?? false,
        imageUrl: imageUrl ?? 'asd',
        creator: creator ?? 'Bahrican',
      );

  factory Annotation.fromJson(Map<String, dynamic> json) {
    final bool containsTarget = json.containsKey('target');
    print(json);
    bool isText = false;
    int? startIndex;
    int? endIndex;
    if (containsTarget) {
      Map<String, dynamic> mapVal = json['target'] as Map<String, dynamic>;
      isText = mapVal.containsKey('selector');
      if (isText) {
        mapVal = (json['target'] as Map<String, dynamic>)['selector']
            as Map<String, dynamic>;
        startIndex = mapVal['start'];
        endIndex = mapVal['end'];
      }
    }
    Offset? startOffset;
    Offset? endOffset;
    String? exactImage;
    if (containsTarget) {
      final Map<String, dynamic> mapVal =
          json['target'] as Map<String, dynamic>;
      final String? imageUrl = mapVal['id'];
      if (imageUrl != null) {
        final int hashIndex =
            !imageUrl.contains('#') ? 0 : imageUrl.indexOf('#');
        if (hashIndex > 0) {
          exactImage = imageUrl.substring(0, hashIndex);
          String temp = imageUrl;
          int nextComma = temp.indexOf('=');
          if (nextComma < temp.length) {
            temp = temp.substring(nextComma + 1);
            nextComma = temp.indexOf(',');
            final String x = temp.substring(0, nextComma);
            temp = temp.substring(nextComma + 1);
            nextComma = temp.indexOf(',');
            final String y = temp.substring(0, nextComma);
            temp = temp.substring(nextComma + 1);
            nextComma = temp.indexOf(',');
            final String w = temp.substring(0, nextComma);
            temp = temp.substring(nextComma + 1);
            final String h = temp.substring(0);
            startOffset =
                Offset(double.tryParse(x) ?? 0, double.tryParse(y) ?? 0);
            endOffset = Offset(startOffset.dx + (double.tryParse(w) ?? 0),
                startOffset.dy + (double.tryParse(h) ?? 0));
          }
        }
      }
    }
    return Annotation(
      id: BaseModel.getByType<String>(json['_id']) ??
          BaseModel.getByType<String>(json['id']),
      courseId: BaseModel.getByType<String>(json['course_id']),
      categoryId: BaseModel.getByType<String>(json['category_id']),
      postId: BaseModel.getByType<String>(json['post_id']),
      content: BaseModel.getByType<String>(json['body']),
      startIndex:
          startIndex ?? BaseModel.getWithDefault<int>(json['start_index'], 0),
      endIndex: endIndex ?? BaseModel.getWithDefault<int>(json['end_index'], 0),
      upVote: BaseModel.getByType<int>(json['upvote']),
      createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
      updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      isAnnotation:
          BaseModel.getWithDefault<bool>(json['is_annotation'], false),
      isImage: !isText,
      imageUrl: exactImage ?? BaseModel.getByType<String>(json['image_url']),
      startOffset: startOffset ??
          BaseModel.getWithDefault<Offset>(json['start_offset'], Offset.zero),
      endOffset: endOffset ??
          BaseModel.getWithDefault<Offset>(json['end_offset'], Offset.zero),
      creator: BaseModel.getByType<String>(json['creator']),
    );
  }

  Annotation copyWith({
    String? content,
    int? startIndex,
    int? endIndex,
    int? upVote,
    Color? colorParam,
    bool? isAnnotation,
    Offset? startOffset,
    Offset? endOffset,
    bool? isImage,
    String? imageUrl,
    String? creator,
  }) {
    final Annotation annotation = Annotation(
      id: id,
      courseId: courseId,
      categoryId: categoryId,
      postId: postId,
      startIndex: startIndex ?? this.startIndex,
      endIndex: endIndex ?? this.endIndex,
      upVote: upVote ?? this.upVote,
      content: content ?? this.content,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isAnnotation: isAnnotation ?? this.isAnnotation,
      isImage: isImage ?? this.isImage,
      startOffset: startOffset ?? this.startOffset,
      endOffset: endOffset ?? this.endOffset,
      imageUrl: imageUrl ?? this.imageUrl,
      creator: creator ?? this.creator,
    );
    annotation.color = colorParam ?? annotation.color;
    return annotation;
  }

  final String? id;
  final String? courseId;
  final String? creator;
  final String? categoryId;
  final String? postId;
  final String? content;
  final int startIndex;
  final int endIndex;
  final int? upVote;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isAnnotation;
  final bool isImage;
  final Offset startOffset;
  final Offset endOffset;
  Color? colorParam;
  final String? imageUrl;

  @override
  Annotation fromJson(Map<String, dynamic> json) => Annotation.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        '_id': id,
        'course_id': courseId,
        'category_id': categoryId,
        'post_id': postId,
        'body': content,
        'start_index': startIndex,
        'end_index': endIndex,
        'upvote': upVote,
        'createdAt': BaseModel.primitiveToJson<DateTime>(createdAt),
        'updatedAt': BaseModel.primitiveToJson<DateTime>(updatedAt),
        'is_annotation': BaseModel.getByType<bool>(isAnnotation),
        'color': BaseModel.primitiveToJson<Color>(color),
        'is_image': isImage,
        'start_offset': startOffset,
        'end_offset': endOffset,
        'image_url': imageUrl,
        'creator': creator,
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        courseId,
        creator,
        categoryId,
        postId,
        content,
        startIndex,
        endIndex,
        upVote,
        createdAt,
        updatedAt,
        isAnnotation,
        color,
        isImage,
        startOffset,
        endOffset,
        imageUrl,
        creator,
      ];

  Color get color {
    if (colorParam != null) return colorParam!;
    return colorParam = ColorHelpers.lightRandomColor;
  }

  set color(Color newColor) => colorParam = newColor;
}
