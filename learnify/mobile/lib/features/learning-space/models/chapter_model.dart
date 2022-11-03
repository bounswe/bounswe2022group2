import '../../../../core/base/model/base_model.dart';

class Chapter extends BaseModel<Chapter> {
  const Chapter({
    this.id,
    this.courseId,
    this.title,
    this.materialText,
    this.materialVisual = const <String>[],
    this.createdAt,
    this.updatedAt,
  });
  factory Chapter.dummy(int id) => Chapter(
        id: id.toString(),
        courseId: id.toString(),
        title: 'Running Apps on Different Devices',
        materialText:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
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
        createdAt: BaseModel.getByType<DateTime>(json['createdAt']),
        updatedAt: BaseModel.getByType<DateTime>(json['updatedAt']),
      );

  Chapter copyWith(
          {String? materialText,
          List<String>? materialVisual,
          String? title}) =>
      Chapter(
        id: id,
        courseId: courseId,
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
        createdAt,
        updatedAt
      ];
}
