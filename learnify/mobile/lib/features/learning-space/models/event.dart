import 'dart:math';

import '../../../../core/base/model/base_model.dart';

class Event extends BaseModel<Event> {
  const Event({
    this.id,
    this.date,
    this.description,
    this.duration,
    this.participationLimit,
    this.eventCreator,
    this.geoLocationLat,
    this.geoLocationLon,
    this.participants = const <String>[],
    this.isHappening = false,
    this.courseId,
    this.isCompleted = false,
  });

  factory Event.dummy(int? id) => Event(
        id: id.toString(),
        courseId: id.toString(),
        date: DateTime.now().add(Duration(days: Random().nextInt(20))),
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        participationLimit: 100,
        duration: Random().nextInt(15) * 60,
        eventCreator: 'eventCreator',
        geoLocationLat: 12,
        geoLocationLon: 34,
        participants: const ['adas', 'bdf', 'cas'],
      );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: BaseModel.getByType<String>(json['id']),
        date: BaseModel.getByType<DateTime>(json['date']),
        description: BaseModel.getByType<String>(json['description']),
        duration: BaseModel.getByType<int>(json['duration']),
        participationLimit:
            BaseModel.getByType<int>(json['participationLimit']),
        eventCreator: BaseModel.getByType<String>(json['eventCreator']),
        geoLocationLat: BaseModel.getByType<double>(json['geoLocationLat']),
        geoLocationLon: BaseModel.getByType<double>(json['geoLocationLon']),
        participants: BaseModel.getWithDefault<List<String>>(
            json['participants'], <String>[]),
        isHappening: BaseModel.getWithDefault<bool>(json['isHappening'], false),
        courseId: BaseModel.getByType<String>(json['courseId']),
        isCompleted: BaseModel.getWithDefault<bool>(json['isCompleted'], false),
      );

  Event copyWith({
    String? id,
    DateTime? date,
    String? description,
    int? duration,
    int? participationLimit,
    String? eventCreator,
    double? geoLocationLat,
    double? geoLocationLon,
    List<String>? participants,
    bool? isHappening,
    String? courseId,
    bool? isCompleted,
  }) =>
      Event(
        id: id ?? this.id,
        date: date ?? this.date,
        description: description ?? this.description,
        participationLimit: participationLimit ?? this.participationLimit,
        duration: duration ?? this.duration,
        courseId: courseId ?? this.courseId,
        eventCreator: eventCreator ?? this.eventCreator,
        geoLocationLat: geoLocationLat ?? this.geoLocationLat,
        geoLocationLon: geoLocationLon ?? this.geoLocationLon,
        isCompleted: isCompleted ?? this.isCompleted,
        isHappening: isHappening ?? this.isHappening,
        participants: participants ?? this.participants,
      );

  final String? id;
  final DateTime? date;
  final String? description;
  final int? duration;
  final int? participationLimit;
  final String? eventCreator;
  final double? geoLocationLat;
  final double? geoLocationLon;
  final List<String> participants;
  final bool isHappening;
  final String? courseId;
  final bool isCompleted;

  @override
  Event fromJson(Map<String, dynamic> json) => Event.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        'date': BaseModel.primitiveToJson<DateTime>(date),
        'description': description,
        'duration': duration,
        'participationLimit': participationLimit,
        'eventCreator': eventCreator,
        'geoLocationLat': geoLocationLat,
        'geoLocationLon': geoLocationLon,
        'participants': participants,
        'isHappening': isHappening,
        'courseId': courseId,
        'isCompleted': isCompleted,
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        id,
        date,
        description,
        duration,
        participationLimit,
        eventCreator,
        geoLocationLat,
        geoLocationLon,
        participants,
        isHappening,
        courseId,
        isCompleted,
      ];
}
