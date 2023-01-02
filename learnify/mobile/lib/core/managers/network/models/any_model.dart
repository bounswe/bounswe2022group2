import '../../../base/model/base_model.dart';

/// Any model.
class AnyModel extends BaseModel<AnyModel> {
  /// Default constructor.
  const AnyModel({this.map});

  factory AnyModel.fromJson({Map<String, dynamic>? map}) => AnyModel(map: map);

  @override
  AnyModel fromJson(Map<String, dynamic> json) => AnyModel.fromJson(map: json);

  /// Map
  final Map<String, dynamic>? map;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{};

  @override
  List<Object?> get props => <Object?>[];
}
