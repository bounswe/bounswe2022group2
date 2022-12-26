import '../../../../core/base/model/base_model.dart';
import '../geolocation/geolocation_model.dart';

class CreateEventRequest extends BaseModel<CreateEventRequest> {
  const CreateEventRequest(
      {this.title,
      this.description,
      this.date,
      this.participationLimit,
      this.duration,
      this.geolocation,
      this.lsId});

  factory CreateEventRequest.fromJson(
          Map<String, dynamic> json) =>
      CreateEventRequest(
          title: BaseModel.getByType<String>(json['title']),
          description: BaseModel.getByType<String>(json['description']),
          date: BaseModel.getByType<DateTime>(json['date']),
          participationLimit:
              BaseModel.getByType<int>(json['participationLimit']),
          duration: BaseModel.getByType<int>(json['duration']),
          geolocation: BaseModel.embeddedModelFromJson<GeoLocation>(
              json['geolocation'], const GeoLocation()),
          lsId: BaseModel.getByType<String>(json['lsId']));

  @override
  CreateEventRequest fromJson(Map<String, dynamic> json) =>
      CreateEventRequest.fromJson(json);

  final String? title;
  final String? description;
  final DateTime? date;
  final int? participationLimit;
  final int? duration;
  final GeoLocation? geolocation;
  final String? lsId;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'title': title,
        'description': description,
        'date': BaseModel.primitiveToJson<DateTime>(date),
        'participationLimit': participationLimit.toString(),
        'duration': duration.toString(),
        'geolocation': BaseModel.embeddedModelToJson<GeoLocation>(geolocation),
        'lsId': lsId
      };

  @override
  List<Object?> get props => <Object?>[
        title,
        description,
        date,
        participationLimit,
        duration,
        geolocation,
        lsId
      ];
}
