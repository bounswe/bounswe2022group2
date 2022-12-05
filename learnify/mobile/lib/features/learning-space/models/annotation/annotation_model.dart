import 'package:flutter/material.dart';

import '../../../../../core/base/model/base_model.dart';
import '../../../../core/helpers/color_helpers.dart';

// ignore: must_be_immutable
class Annotation extends BaseModel<Annotation> {
  Annotation({
    this.id,
    this.courseId,
    this.creator,
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
  });

  factory Annotation.dummy(
    int id, {
    int? startIndex,
    int? endIndex,
    Offset? startOffset,
    Offset? endOffset,
    bool? isImage,
    String? imageUrl,
  }) =>
      Annotation(
        id: id.toString(),
        courseId: id.toString(),
        creator: id.toString(),
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
      );

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        id: BaseModel.getByType<String>(json['_id']),
        courseId: BaseModel.getByType<String>(json['course_id']),
        creator: BaseModel.getByType<String>(json['creator']),
        categoryId: BaseModel.getByType<String>(json['category_id']),
        postId: BaseModel.getByType<String>(json['post_id']),
        content: BaseModel.getByType<String>(json['content']),
        startIndex: BaseModel.getWithDefault<int>(json['start_index'], 0),
        endIndex: BaseModel.getWithDefault<int>(json['end_index'], 0),
        upVote: BaseModel.getByType<int>(json['upvote']),
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
        isAnnotation:
            BaseModel.getWithDefault<bool>(json['is_annotation'], false),
        isImage: BaseModel.getWithDefault<bool>(json['is_image'], false),
        startOffset: json['start_offset'],
        endOffset: json['end_offset'],
        imageUrl: json['image_url'],
      );

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
  }) {
    final Annotation annotation = Annotation(
      id: id,
      courseId: courseId,
      creator: creator,
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
        'creator': creator,
        'category_id': categoryId,
        'post_id': postId,
        'content': content,
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
      ];

  Color get color {
    if (colorParam != null) return colorParam!;
    return colorParam = ColorHelpers.lightRandomColor;
  }

  set color(Color newColor) => colorParam = newColor;
}
