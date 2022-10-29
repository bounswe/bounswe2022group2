import '../../../../core/base/model/base_model.dart';

class User extends BaseModel<User> {
  const User({this.email, this.isVerified, this.code, this.id});

  factory User.fromJson(Map<String, dynamic> json) => User(
      email: BaseModel.getByType<String>(json['email']),
      isVerified: BaseModel.getByType<bool>(json['is_verified']),
      code: BaseModel.getByType<String>(json['code']),
      id: BaseModel.getByType<String>(json['id']));

  final String? email;
  final bool? isVerified;
  final String? code;
  final String? id;

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'email': email,
        'is_verified': isVerified,
        'code': code,
        'id': id
      };

  @override
  List<Object?> get props => <Object?>[email, isVerified, code, id];
}
