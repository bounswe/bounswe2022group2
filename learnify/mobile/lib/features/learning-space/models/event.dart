import 'dart:math';

import '../../../../core/base/model/base_model.dart';

class Event extends BaseModel<Event> {
  const Event({
    required this.date,
    this.id,
    this.description,
    this.title,
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
        date: (id ?? 0) % 3 == 0
            ? DateTime.now().subtract(Duration(days: Random().nextInt(20)))
            : DateTime.now().add(Duration(days: Random().nextInt(20))),
        title: "Let's Do This",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.",
        participationLimit: 100,
        duration: Random().nextInt(15) * 60,
        eventCreator: 'eventCreator',
        geoLocationLat: 12,
        geoLocationLon: 34,
        participants: const ['adas', 'bdf', 'cas'],
      );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: BaseModel.getByType<String>(json['_id']),
        date: BaseModel.getWithDefault<DateTime>(json['date'], DateTime.now()),
        description: BaseModel.getByType<String>(json['description']),
        title: BaseModel.getByType<String>(json['title']),
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
    String? title,
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
        title: title ?? this.title,
        eventCreator: eventCreator ?? this.eventCreator,
        geoLocationLat: geoLocationLat ?? this.geoLocationLat,
        geoLocationLon: geoLocationLon ?? this.geoLocationLon,
        isCompleted: isCompleted ?? this.isCompleted,
        isHappening: isHappening ?? this.isHappening,
        participants: participants ?? this.participants,
      );

  final String? id;
  final DateTime date;
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
  final String? title;

  @override
  Event fromJson(Map<String, dynamic> json) => Event.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        '_id': id,
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
        'title': title,
      };

  @override
  List<Object?> get props => <Object?>[
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
        title
      ];
}
