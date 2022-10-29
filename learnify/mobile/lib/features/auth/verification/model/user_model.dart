import '../../../../core/base/model/base_model.dart';

class User extends BaseModel<User> {
  const User({
    this.email,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      email: BaseModel.getByType<String>(json['email']),
      isVerified: BaseModel.getByType<bool>(json['is_verified']),
      createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
      updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      code: BaseModel.getByType<String>(json['code']),
      id: BaseModel.getByType<String>(json['id']));

  final String? email;
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
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'code': code,
        'id': id
      };

  @override
  List<Object?> get props =>
      <Object?>[email, isVerified, createdAt, updatedAt, code, id];
}
