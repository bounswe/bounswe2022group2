import 'dart:math';

import '../../../../core/base/model/base_model.dart';
import 'geolocation/geolocation_model.dart';

class Event extends BaseModel<Event> {
  const Event({
    required this.date,
    this.id,
    this.description,
    this.title,
    this.duration,
    this.participationLimit,
    this.eventCreator,
    this.geoLocation,
    this.participants = const <String>[],
    this.lsId,
  });
  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: BaseModel.getByType<String>(json['_id']) ??
            BaseModel.getByType<String>(json['id']),
        date: BaseModel.getWithDefault<DateTime>(json['date'], DateTime.now()),
        description: BaseModel.getByType<String>(json['description']),
        title: BaseModel.getByType<String>(json['title']),
        duration: BaseModel.getByType<int>(json['duration']),
        participationLimit:
            BaseModel.getByType<int>(json['participationLimit']),
        eventCreator: BaseModel.getByType<String>(json['eventCreator']),
        geoLocation: BaseModel.embeddedModelFromJson<GeoLocation>(
            json['geoLocation'], const GeoLocation()),
        participants: BaseModel.getWithDefault<List<String>>(
            json['participants'], <String>[]),
        lsId: BaseModel.getByType<String>(json['lsId']),
      );

  factory Event.dummy(int? id) => Event(
        id: id.toString(),
        lsId: id.toString(),
        date: (id ?? 0) % 3 == 0
            ? DateTime.now().subtract(Duration(
                days: Random().nextInt(20),
                hours: Random().nextInt(14),
                minutes: Random().nextInt(47)))
            : DateTime.now().add(Duration(
                days: Random().nextInt(20),
                hours: Random().nextInt(14),
                minutes: Random().nextInt(47))),
        title: _eventTitles[id ?? 0],
        description: _eventDescriptions[id ?? 0],
        participationLimit: Random().nextInt(50) + 50,
        duration: Random().nextInt(15) * 60,
        eventCreator: 'eventCreator',
        geoLocation: GeoLocation.dummy(),
        participants: const <String>['adas', 'bdf', 'cas'],
      );

  static const List<String> _eventTitles = <String>[
    "Solving Difficulties",
    "Q&A Session",
    "Just to Talk",
    "Let's Learn",
    "Next Post?"
  ];

  static const List<String> _eventDescriptions = <String>[
    "We all had difficulties in this journey together. Solving them via online tools is hard sometimes. Let's meet and solve these issues together face to face.",
    "We all work, sometimes we deserve coffee. Hope to see you all!",
    "Knowing each other face to face will be nice. I want to meet you all!",
    "I think we can expand our vision about this learning space and put a different thing together.",
    "Adding an interesting and attractive post will help us to increase the participant number."
  ];

  Event copyWith({
    String? id,
    DateTime? date,
    String? description,
    int? duration,
    int? participationLimit,
    String? eventCreator,
    String? title,
    GeoLocation? geoLocation,
    List<String>? participants,
    bool? isHappening,
    String? lsId,
    bool? isCompleted,
  }) =>
      Event(
        id: id ?? this.id,
        date: date ?? this.date,
        description: description ?? this.description,
        participationLimit: participationLimit ?? this.participationLimit,
        duration: duration ?? this.duration,
        lsId: lsId ?? this.lsId,
        title: title ?? this.title,
        eventCreator: eventCreator ?? this.eventCreator,
        geoLocation: geoLocation ?? this.geoLocation,
        participants: participants ?? this.participants,
      );

  final String? id;
  final DateTime date;
  final String? description;
  final int? duration;
  final int? participationLimit;
  final String? eventCreator;
  final GeoLocation? geoLocation;
  final List<String> participants;
  final String? lsId;
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
        'geoLocation': geoLocation,
        'participants': participants,
        'geoLocation': BaseModel.embeddedModelToJson<GeoLocation>(geoLocation),
        'lsId': lsId,
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
        geoLocation,
        participants,
        lsId,
        title
      ];
}
