import '../../../../core/base/model/base_model.dart';
import 'annotation_model.dart';

class Chapter extends BaseModel<Chapter> {
  const Chapter({
    this.id,
    this.courseId,
    this.title,
    this.materialText,
    this.annotations = const <Annotation>[],
    this.materialVisual = const <String>[],
    this.createdAt,
    this.updatedAt,
  });

  factory Chapter.dummy(int id) => Chapter(
        id: id.toString(),
        courseId: id.toString(),
        title: 'Running Apps on Different Devices',
        materialText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        materialVisual: const <String>[
          'https://picsum.photos/id/1/700/400',
          'https://picsum.photos/id/2/700/400',
          'https://picsum.photos/id/3/700/400'
        ],
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now(),
      );

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: BaseModel.getByType<String>(json['id']),
        courseId: BaseModel.getByType<String>(json['course_id']),
        title: BaseModel.getByType<String>(json['title']),
        materialText: BaseModel.getByType<String>(json['material_text']),
        materialVisual: BaseModel.getList<String>(json['material_visual']),
        annotations: BaseModel.embeddedListFromJson<Annotation>(
            json['annotations'], Annotation()),
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      );

  Chapter copyWith({
    String? materialText,
    List<String>? materialVisual,
    List<Annotation>? annotations,
    String? title,
  }) =>
      Chapter(
        id: id,
        courseId: courseId,
        annotations: annotations ?? this.annotations,
        materialText: materialText ?? this.materialText,
        materialVisual: materialVisual ?? this.materialVisual,
        createdAt: createdAt,
        updatedAt: updatedAt,
        title: title ?? this.title,
      );

  final String? id;
  final String? materialText;
  final String? title;
  final List<String> materialVisual;
  final List<Annotation> annotations;
  final String? courseId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  Chapter fromJson(Map<String, dynamic> json) => Chapter.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        'title': title,
        'course_id': courseId,
        'material_text': materialText,
        'material_visual': materialVisual,
        'annotations': BaseModel.embeddedListToJson<Annotation>(annotations),
        'createdAt': BaseModel.primitiveToJson<DateTime>(createdAt),
        'updatedAt': BaseModel.primitiveToJson<DateTime>(updatedAt),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        courseId,
        materialText,
        materialVisual,
        annotations,
        createdAt,
        updatedAt
      ];
}
