import '../../../core/base/model/base_model.dart';

class Course extends BaseModel<Course> {
  const Course({this.name, this.numParticipants});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
      name: BaseModel.getByType<String>(json['name']),
      numParticipants: BaseModel.getByType<int>(json['num_participants']));

  Course copyWith(String? name, int? numParticipants) => Course(
      name: name ?? this.name,
      numParticipants: numParticipants ?? this.numParticipants);

  final String? name;
  final int? numParticipants;

  @override
  Course fromJson(Map<String, dynamic> json) => Course.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'name': name,
        'num_participants': BaseModel.primitiveToJson<int>(numParticipants)
      };

  @override
  List<Object?> get props => <Object?>[name, numParticipants];
}
