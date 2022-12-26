import '../../../core/base/model/base_model.dart';

class UserSearchResponse extends BaseModel<UserSearchResponse> {
  const UserSearchResponse({this.users = const <String>[]});

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
      UserSearchResponse(users: BaseModel.getList<String>(json['users']));

  final List<String> users;

  @override
  UserSearchResponse fromJson(Map<String, dynamic> json) =>
      UserSearchResponse.fromJson(json);
  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'users': BaseModel.primitiveToJson(users),
      };

  @override
  List<Object?> get props => <Object?>[
        users,
      ];
}
