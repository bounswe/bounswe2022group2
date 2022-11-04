import '../../../../core/base/model/base_model.dart';

class Annotation extends BaseModel<Annotation> {
  const Annotation({
    this.id,
    this.courseId,
    this.ownerId,
    this.categoryId,
    this.chapterId,
    this.startIndex,
    this.endIndex,
    this.upVote,
    this.content,
    this.createdAt,
    this.updatedAt,
  });
  factory Annotation.dummy(int id) => Annotation(
        id: id.toString(),
        courseId: id.toString(),
        ownerId: id.toString(),
        categoryId: id.toString(),
        chapterId: id.toString(),
        startIndex: 3,
        endIndex: 10,
        upVote: 2,
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
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
        startIndex: BaseModel.getByType<int>(json['start_index']),
        endIndex: BaseModel.getByType<int>(json['end_index']),
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
  final int? startIndex;
  final int? endIndex;
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
