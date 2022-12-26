import '../../../core/base/model/base_model.dart';
import 'comment/comment_model.dart';

class Post extends BaseModel<Post> {
  const Post({
    this.id,
    this.title,
    this.creator,
    this.content,
    this.images = const <String>[],
    this.createdAt,
    this.updatedAt,
    this.comments = const <Comment>[],
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final List<String> fetchedImages =
        BaseModel.getList<String>(json['images']);
    return Post(
        id: BaseModel.getByType<String>(json['_id']) ??
            BaseModel.getByType<String>(json['id']),
        title: BaseModel.getByType<String>(json['title']),
        creator: BaseModel.getByType<String>(json['creator']),
        content: BaseModel.getByType<String>(json['content']),
        images: fetchedImages.isEmpty ? const <String>[] : fetchedImages,
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
        comments: BaseModel.embeddedListFromJson<Comment>(
            json['comments'], const Comment()));
  }

  factory Post.dummy(int id) => Post(
        id: id.toString(),
        title: 'Running Apps on Different Devices',
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        creator: 'bahricanyesil',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      );

  Post copyWith(
          {String? title,
          String? creator,
          String? content,
          List<String>? images,
          List<Comment>? comments}) =>
      Post(
          id: id ?? id,
          title: title ?? this.title,
          creator: creator ?? this.creator,
          content: content ?? this.content,
          images: images ?? this.images,
          comments: comments ?? this.comments,
          createdAt: createdAt,
          updatedAt: updatedAt);

  final String? id;
  final String? title;
  final String? creator;
  final String? content;
  final List<String> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Comment> comments;

  @override
  Post fromJson(Map<String, dynamic> json) => Post.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        '_id': id,
        'title': title,
        'creator': creator,
        'content': content,
        'images': images,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'comments': BaseModel.embeddedListToJson<Comment>(comments)
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        creator,
        content,
        images,
        createdAt,
        updatedAt,
        comments
      ];
}
