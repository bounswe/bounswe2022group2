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
        geoLocationLat: BaseModel.getByType<double>(json['geoLocationLat']),
        geoLocationLon: BaseModel.getByType<double>(json['geoLocationLon']),
        participants: BaseModel.getWithDefault<List<String>>(
            json['participants'], <String>[]),
        isHappening: BaseModel.getWithDefault<bool>(json['isHappening'], false),
        courseId: BaseModel.getByType<String>(json['courseId']),
        isCompleted: BaseModel.getWithDefault<bool>(json['isCompleted'], false),
      );

  factory Event.dummy(int? id) => Event(
        id: id.toString(),
        courseId: id.toString(),
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
        geoLocationLat: 12,
        geoLocationLon: 34,
        participants: const ['adas', 'bdf', 'cas'],
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
