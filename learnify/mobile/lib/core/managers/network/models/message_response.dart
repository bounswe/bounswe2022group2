import '../../../../core/base/model/base_model.dart';

/// MessageResponse model.
class MessageResponse extends BaseModel<MessageResponse> {
  /// Default constructor.
  const MessageResponse({this.resultMessage});

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      MessageResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']));

  /// resultMessage String.
  final String? resultMessage;

  @override
  MessageResponse fromJson(Map<String, dynamic> json) =>
      MessageResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson =>
      <String, dynamic>{'resultMessage': resultMessage};

  @override
  List<Object?> get props => <Object?>[resultMessage];
}
