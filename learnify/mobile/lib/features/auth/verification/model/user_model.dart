import '../../../../core/base/model/base_model.dart';

class User extends BaseModel<User> {
  const User({
    this.email,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.id,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: BaseModel.getByType<String>(json['email']),
        username: BaseModel.getByType<String>(json['username']),
        isVerified: BaseModel.getByType<bool>(json['is_verified']),
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
        code: BaseModel.getByType<String>(json['code']),
        id: BaseModel.getByType<String>(json['_id']) ??
            BaseModel.getByType<String>(json['id']),
      );

  User copyWith({String? username}) => User(
        code: code,
        createdAt: createdAt,
        email: email,
        id: id,
        isVerified: isVerified,
        updatedAt: updatedAt,
        username: username ?? this.username,
      );

  final String? email;
  final String? username;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? code;
  final String? id;

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'email': email,
        'is_verified': isVerified,
        'createdAt': BaseModel.primitiveToJson<DateTime>(createdAt),
        'updatedAt': BaseModel.primitiveToJson<DateTime>(updatedAt),
        'code': code,
        'username': username,
        '_id': id
      };

  @override
  List<Object?> get props =>
      <Object?>[email, isVerified, username, createdAt, updatedAt, code, id];
}
