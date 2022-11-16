import '../../../../core/base/model/base_model.dart';
import '../../auth/verification/model/user_model.dart';

class LearningSpace extends BaseModel<LearningSpace> {
  const LearningSpace({
    this.id,
    this.title,
    this.description,
    this.numParticipants = 0,
    this.iconId = 1,
    this.categories = const <String>[],
    this.creator,
    this.admins = const <User>[],
    this.createdAt,
    this.updatedAt,
  });

  factory LearningSpace.dummy(int id) => LearningSpace(
        id: id.toString(),
        title: 'Learning Guitar',
        description:
            'Music lovers of all levers learning to improve their tunes!',
        numParticipants: 10,
        iconId: 5,
        categories: const <String>['music', 'string-instruments'],
        creator: id.toString(),
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now(),
      );

  factory LearningSpace.fromJson(Map<String, dynamic> json) => LearningSpace(
        id: BaseModel.getByType<String>(json['id']),
        title: BaseModel.getByType<String>(json['title']),
        description: BaseModel.getByType<String>(json['description']),
        numParticipants: BaseModel.getByType<int>(json['num_participants']),
        iconId: BaseModel.getByType<int>(json['icon_id']),
        categories: BaseModel.getList<String>(json['categories']),
        creator: BaseModel.getByType<String>(json['creator']),
        admins:
            BaseModel.embeddedListFromJson<User>(json['admins'], const User()),
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      );

  LearningSpace copyWith(
          {String? title,
          String? description,
          int? numParticipants,
          int? iconId,
          List<String>? categories,
          String? creator,
          List<User>? admins}) =>
      LearningSpace(
        id: id,
        title: title,
        description: description,
        numParticipants: numParticipants,
        iconId: iconId,
        categories: categories ?? this.categories,
        creator: creator,
        admins: admins ?? this.admins,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  final String? id;
  final String? title;
  final String? description;
  final int? numParticipants;
  final int? iconId;
  final List<String> categories;
  final List<User> admins;
  final String? creator;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  LearningSpace fromJson(Map<String, dynamic> json) =>
      LearningSpace.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'num_participants': numParticipants.toString(),
        'icon_id': iconId.toString(),
        'categories': categories,
        'creator': creator,
        'admins': BaseModel.embeddedListToJson<User>(admins),
        'createdAt': BaseModel.primitiveToJson<DateTime>(createdAt),
        'updatedAt': BaseModel.primitiveToJson<DateTime>(updatedAt),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        description,
        numParticipants,
        iconId,
        categories,
        creator,
        admins,
        createdAt,
        updatedAt
      ];
}
