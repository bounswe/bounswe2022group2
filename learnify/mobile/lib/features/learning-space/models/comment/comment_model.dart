import '../../../../core/base/model/base_model.dart';

class Comment extends BaseModel<Comment> {
  const Comment({
    this.id,
    this.creator,
    this.images = const <String>[],
    this.content,
  });

  factory Comment.dummy(int id) => Comment(
        id: id.toString(),
        creator: 'ezgi',
        content: "This is a comment",
      );

  factory Comment.fromJson(Map<String, dynamic> json) {
    final List<String> fetchedImages =
        BaseModel.getList<String>(json['images']);
    return Comment(
      id: BaseModel.getByType<String>(json['_id']) ??
          BaseModel.getByType<String>(json['id']),
      creator: BaseModel.getByType<String>(json['creator']),
      images: fetchedImages,
      content: BaseModel.getByType<String>(json['content']),
    );
  }

  Comment copyWith({String? creator, String? content, List<String>? images}) =>
      Comment(
        id: id ?? id,
        creator: creator ?? this.creator,
        content: content ?? this.content,
        images: images ?? this.images,
      );

  final String? id;
  final String? creator;
  final String? content;
  final List<String> images;

  @override
  Comment fromJson(Map<String, dynamic> json) => Comment.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        '_id': id,
        'creator': creator,
        'content': content,
        'images': images,
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        creator,
        content,
        images,
      ];
}
