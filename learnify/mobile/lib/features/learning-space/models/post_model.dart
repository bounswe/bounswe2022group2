import '../../../core/base/model/base_model.dart';
import 'annotation/annotation_model.dart';

class Post extends BaseModel<Post> {
  const Post({
    this.id,
    this.title,
    this.creator,
    this.content,
    this.annotations = const <Annotation>[],
    this.images = const <String>[],
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: BaseModel.getByType<String>(json['id']),
      title: BaseModel.getByType<String>(json['title']),
      creator: BaseModel.getByType<String>(json['creator']),
      content: BaseModel.getByType<String>(json['content']),
      annotations: BaseModel.embeddedListFromJson<Annotation>(
          json['annotations'], Annotation()),
      images: BaseModel.getList<String>(json['images']),
      createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
      updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']));

  Post copyWith(
          {String? title,
          String? creator,
          String? content,
          List<Annotation>? annotations,
          List<String>? images}) =>
      Post(
          id: id,
          title: title,
          creator: creator,
          content: content,
          annotations: annotations ?? this.annotations,
          images: images ?? this.images,
          createdAt: createdAt,
          updatedAt: updatedAt);

  final String? id;
  final String? title;
  final String? creator;
  final String? content;
  final List<Annotation> annotations;
  final List<String> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Post fromJson(Map<String, dynamic> json) => Post.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        'title': title,
        'creator': creator,
        'content': content,
        'annotations': BaseModel.embeddedListToJson<Annotation>(annotations),
        'images': images,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        creator,
        content,
        annotations,
        images,
        createdAt,
        updatedAt
      ];
}
