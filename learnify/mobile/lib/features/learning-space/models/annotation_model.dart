import '../../../../core/base/model/base_model.dart';

class Annotation extends BaseModel<Annotation> {
  const Annotation({
    this.id,
    this.courseId,
    this.ownerId,
    this.categoryId,
    this.chapterId,
    this.startIndex = 0,
    this.endIndex = 0,
    this.upVote,
    this.content,
    this.createdAt,
    this.updatedAt,
  });
  factory Annotation.dummy(int id, {int? startIndex, int? endIndex}) =>
      Annotation(
        id: id.toString(),
        courseId: id.toString(),
        ownerId: id.toString(),
        categoryId: id.toString(),
        chapterId: id.toString(),
        startIndex: startIndex ?? 12,
        endIndex: endIndex ?? 26,
        upVote: 2,
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      );

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        id: BaseModel.getByType<String>(json['id']),
        courseId: BaseModel.getByType<String>(json['course_id']),
        ownerId: BaseModel.getByType<String>(json['owner_id']),
        categoryId: BaseModel.getByType<String>(json['category_id']),
        chapterId: BaseModel.getByType<String>(json['chapter_id']),
        content: BaseModel.getByType<String>(json['content']),
        startIndex: BaseModel.getWithDefault<int>(json['start_index'], 0),
        endIndex: BaseModel.getWithDefault<int>(json['end_index'], 0),
        upVote: BaseModel.getByType<int>(json['upvote']),
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      );

  Annotation copyWith(
          {String? content, int? startIndex, int? endIndex, int? upVote}) =>
      Annotation(
        id: id,
        courseId: courseId,
        ownerId: ownerId,
        categoryId: categoryId,
        chapterId: chapterId,
        startIndex: startIndex ?? this.startIndex,
        endIndex: endIndex ?? this.endIndex,
        upVote: upVote ?? this.upVote,
        content: content ?? this.content,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  final String? id;
  final String? courseId;
  final String? ownerId;
  final String? categoryId;
  final String? chapterId;
  final String? content;
  final int startIndex;
  final int endIndex;
  final int? upVote;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Annotation fromJson(Map<String, dynamic> json) => Annotation.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        'course_id': courseId,
        'owner_id': ownerId,
        'category_id': categoryId,
        'chapter_id': chapterId,
        'content': content,
        'start_index': startIndex,
        'end_index': endIndex,
        'upvote': upVote,
        'createdAt': BaseModel.primitiveToJson<DateTime>(createdAt),
        'updatedAt': BaseModel.primitiveToJson<DateTime>(updatedAt),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        courseId,
        ownerId,
        categoryId,
        chapterId,
        content,
        startIndex,
        endIndex,
        upVote,
        createdAt,
        updatedAt
      ];
}
