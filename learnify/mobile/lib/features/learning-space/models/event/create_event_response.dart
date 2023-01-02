import '../../../../core/base/model/base_model.dart';
import 'event.dart';

class CreateEventResponse extends BaseModel<CreateEventResponse> {
  const CreateEventResponse({this.resultMessage, this.event});

  factory CreateEventResponse.fromJson(Map<String, dynamic> json) =>
      CreateEventResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          event: BaseModel.embeddedModelFromJson<Event>(
              json['event'], const Event()));

  @override
  CreateEventResponse fromJson(Map<String, dynamic> json) =>
      CreateEventResponse.fromJson(json);

  final String? resultMessage;
  final Event? event;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'event': BaseModel.embeddedModelToJson<Event>(event)
      };

  @override
  List<Object?> get props => <Object?>[resultMessage, event];
}
