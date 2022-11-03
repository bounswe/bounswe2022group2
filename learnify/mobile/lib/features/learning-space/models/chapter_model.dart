import '../../../../core/base/model/base_model.dart';
import '../../../core/helpers/random_helper.dart';

class Chapter extends BaseModel<Chapter> {
  const Chapter({
    this.id,
    this.courseId,
    this.materialText,
    this.materialVisual = const <String>[],
    this.createdAt,
    this.updatedAt,
  });
  factory Chapter.dummy(int id) => Chapter(
        id: id.toString(),
        courseId: id.toString(),
        materialText: RandomHelper.randomString(),
        materialVisual: const <String>[
          'https://picsum.photos/700/400',
          'https://picsum.photos/700/400',
          'https://picsum.photos/700/400'
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      );

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: BaseModel.getByType<String>(json['id']),
        courseId: BaseModel.getByType<String>(json['course_id']),
        materialText: BaseModel.getByType<String>(json['material_text']),
        materialVisual: BaseModel.getList<String>(json['material_visual']),
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      );

  Chapter copyWith({String? materialText, List<String>? materialVisual}) =>
      Chapter(
        id: id,
        courseId: courseId,
        materialText: materialText ?? this.materialText,
        materialVisual: materialVisual ?? this.materialVisual,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  final String? id;
  final String? materialText;
  final List<String> materialVisual;
  final String? courseId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Chapter fromJson(Map<String, dynamic> json) => Chapter.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        'course_id': courseId,
        'material_text': materialText,
        'material_visual': materialVisual,
        'createdAt': BaseModel.primitiveToJson<DateTime>(createdAt),
        'updatedAt': BaseModel.primitiveToJson<DateTime>(updatedAt),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        courseId,
        materialText,
        materialVisual,
        createdAt,
        updatedAt
      ];
}
