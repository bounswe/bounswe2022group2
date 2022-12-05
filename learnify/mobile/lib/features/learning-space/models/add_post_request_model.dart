import '../../../core/base/model/base_model.dart';

class AddPostRequestModel extends BaseModel<AddPostRequestModel> {
  const AddPostRequestModel(
      {this.lsId, this.title, this.content, this.images = const <String>[]});

  factory AddPostRequestModel.fromJson(Map<String, dynamic> json) =>
      AddPostRequestModel(
          lsId: BaseModel.getByType<String>(json['ls_id']),
          title: BaseModel.getByType<String>(json['title']),
          content: BaseModel.getByType<String>(json['content']),
          images: BaseModel.getList<String>(json['images']));

  final String? lsId;
  final String? title;
  final String? content;
  final List<String> images;

  @override
  AddPostRequestModel fromJson(Map<String, dynamic> json) =>
      AddPostRequestModel.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'ls_id': lsId,
        'title': title,
        'content': content,
        'images': images
      };

  @override
  List<Object?> get props => <Object?>[lsId, title, content, images];
}
