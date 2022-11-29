import '../../../core/base/model/base_model.dart';

class LearningSpace extends BaseModel<LearningSpace> {
  const LearningSpace({this.name, this.numParticipants});

  factory LearningSpace.fromJson(Map<String, dynamic> json) => LearningSpace(
      name: BaseModel.getByType<String>(json['name']),
      numParticipants: BaseModel.getByType<int>(json['num_participants']));

  LearningSpace copyWith(String? name, int? numParticipants) => LearningSpace(
      name: name ?? this.name,
      numParticipants: numParticipants ?? this.numParticipants);

  final String? name;
  final int? numParticipants;

  @override
  LearningSpace fromJson(Map<String, dynamic> json) =>
      LearningSpace.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'name': name,
        'num_participants': BaseModel.primitiveToJson<int>(numParticipants)
      };

  @override
  List<Object?> get props => <Object?>[name, numParticipants];
}
