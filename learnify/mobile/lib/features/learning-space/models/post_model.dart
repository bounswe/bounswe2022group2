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

  factory Post.fromJson(Map<String, dynamic> json) {
    final List<String> fetchedImages =
        BaseModel.getList<String>(json['images']);
    return Post(
        id: BaseModel.getByType<String>(json['_id']) ??
            BaseModel.getByType<String>(json['id']),
        title: BaseModel.getByType<String>(json['title']),
        creator: BaseModel.getByType<String>(json['creator']),
        content: BaseModel.getByType<String>(json['content']),
        annotations: BaseModel.embeddedListFromJson<Annotation>(
            json['annotations'], Annotation()),
        images: fetchedImages.isEmpty
            ? const <String>[
                'https://picsum.photos/id/1/700/400',
                'https://picsum.photos/id/2/700/400',
                'https://picsum.photos/id/3/700/400'
              ]
            : fetchedImages,
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']));
  }

  factory Post.dummy(int id) => Post(
        id: id.toString(),
        title: 'Running Apps on Different Devices',
        content:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        images: const <String>[
          'https://picsum.photos/id/1/700/400',
          'https://picsum.photos/id/2/700/400',
          'https://picsum.photos/id/3/700/400'
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      );

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
        '_id': id,
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
