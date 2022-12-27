import '../../../../core/base/model/base_model.dart';

class CommentRequestModel extends BaseModel<CommentRequestModel> {
  const CommentRequestModel(
      {this.lsId, this.postId, this.content, this.images = const <String>[]});

  factory CommentRequestModel.fromJson(Map<String, dynamic> json) =>
      CommentRequestModel(
          lsId: BaseModel.getByType<String>(json['ls_id']),
          postId: BaseModel.getByType<String>(json['post_id']),
          content: BaseModel.getByType<String>(json['content']),
          images: BaseModel.getList<String>(json['images']));

  final String? lsId;
  final String? postId;
  final String? content;
  final List<String> images;

  @override
  CommentRequestModel fromJson(Map<String, dynamic> json) =>
      CommentRequestModel.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'ls_id': lsId,
        'post_id': postId,
        'content': content,
        'images': images
      };

  @override
  List<Object?> get props => <Object?>[lsId, postId, content, images];
}
