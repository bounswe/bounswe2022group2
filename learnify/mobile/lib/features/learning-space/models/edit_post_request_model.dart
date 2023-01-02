import '../../../core/base/model/base_model.dart';

class EditPostRequestModel extends BaseModel<EditPostRequestModel> {
  const EditPostRequestModel(
      {this.lsId,
      this.postId,
      this.title,
      this.content,
      this.images = const <String>[]});

  factory EditPostRequestModel.fromJson(Map<String, dynamic> json) =>
      EditPostRequestModel(
          lsId: BaseModel.getByType<String>(json['ls_id']),
          postId: BaseModel.getByType<String>(['post_id']),
          title: BaseModel.getByType<String>(json['title']),
          content: BaseModel.getByType<String>(json['content']),
          images: BaseModel.getList<String>(json['images']));

  final String? lsId;
  final String? postId;
  final String? title;
  final String? content;
  final List<String> images;

  @override
  EditPostRequestModel fromJson(Map<String, dynamic> json) =>
      EditPostRequestModel.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'ls_id': lsId,
        'post_id': postId,
        'title': title,
        'content': content,
        'images': images
      };

  @override
  List<Object?> get props => <Object?>[lsId, postId, title, content, images];
}
