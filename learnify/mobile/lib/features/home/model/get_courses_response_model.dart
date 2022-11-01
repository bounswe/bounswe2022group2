import '../../../core/base/model/base_model.dart';
import 'course_model.dart';

class GetCoursesResponse extends BaseModel<GetCoursesResponse> {
  const GetCoursesResponse(
      {this.resultMessage,
      this.takenCourses = const <Course>[],
      this.friendCourses = const <Course>[],
      this.recommendedCourses = const <Course>[]});

  factory GetCoursesResponse.fromJson(Map<String, dynamic> json) =>
      GetCoursesResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          takenCourses: BaseModel.embeddedListFromJson<Course>(
              json['takenCourses'], const Course()),
          friendCourses: BaseModel.embeddedListFromJson<Course>(
              json['friendCourses'], const Course()),
          recommendedCourses: BaseModel.embeddedListFromJson<Course>(
              json['recomendedCourses'], const Course()));

  final String? resultMessage;
  final List<Course> takenCourses;
  final List<Course> friendCourses;
  final List<Course> recommendedCourses;

  @override
  GetCoursesResponse fromJson(Map<String, dynamic> json) =>
      GetCoursesResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'takenCourses': BaseModel.embeddedListToJson<Course>(takenCourses),
        'friendCourses': BaseModel.embeddedListToJson<Course>(friendCourses),
        'recomendedCourses':
            BaseModel.embeddedListToJson<Course>(recommendedCourses)
      };

  @override
  List<Object?> get props =>
      <Object?>[resultMessage, takenCourses, friendCourses, recommendedCourses];
}
