import '../../../../core/base/model/base_model.dart';
import 'comment_model.dart';

class AddCommentResponse extends BaseModel<AddCommentResponse> {
  const AddCommentResponse({this.resultMessage, this.comment});

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) =>
      AddCommentResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          comment: BaseModel.embeddedModelFromJson<Comment>(
              json['Comment'], const Comment()));

  final String? resultMessage;
  final Comment? comment;

  @override
  AddCommentResponse fromJson(Map<String, dynamic> json) =>
      AddCommentResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'comment': BaseModel.embeddedModelToJson<Comment>(comment)
      };

  @override
  List<Object?> get props => <Object?>[resultMessage, comment];
}
