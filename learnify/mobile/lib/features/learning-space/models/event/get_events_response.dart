import '../../../../core/base/model/base_model.dart';
import 'event.dart';

class GetEventsResponse extends BaseModel<GetEventsResponse> {
  const GetEventsResponse({this.events = const <Event>[]});

  factory GetEventsResponse.fromJson(Map<String, dynamic> json) =>
      GetEventsResponse(
        events: BaseModel.embeddedListFromJson<Event>(
            json['events'], const Event()),
      );

  @override
  GetEventsResponse fromJson(Map<String, dynamic> json) =>
      GetEventsResponse.fromJson(json);

  final List<Event> events;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'events': BaseModel.embeddedListToJson<Event>(events),
      };

  @override
  List<Object?> get props => <Object?>[events];
}
