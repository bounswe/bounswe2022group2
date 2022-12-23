import 'dart:core';

import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../models/add_post_request_model.dart';
import '../models/annotation/annotation_model.dart';
import '../models/annotation/create_annotation_response.dart';
import '../models/annotation/get_annotations_response.dart';
import '../models/categories_response_model.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';
import '../models/edit_post_request_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import 'l_ls_service.dart';

/// Service for network request of auth view-model.
class LSService extends ILSService {
  /// Factory constructor for singleton structure.
  factory LSService() => _instance;
  LSService._();

  static final LSService _instance = LSService._();

  /// Static instance getter of [LSService].
  static LSService get instance => _instance;

  static const String _create = '/learningspace';
  static const String _categories = '/categories';
  static const String _enrollLS = '/learningspace/enroll';
  static const String _addPost = '/learningSpace/post';
  static const String _editPost = '/learningSpace/edit/post';
  static const String _createAnnotation = '/annotations-service/create';
  static const String _getAnnotations = '/annotations-service/get';

  static const String _randomUserData = 'https://randomuser.me/api/?results=50';

  Future<IResponseModel<AnyModel>> randomUsers() async =>
      networkManager.send<AnyModel, AnyModel>(
        _randomUserData,
        parseModel: const AnyModel(),
        type: RequestTypes.get,
        requireAuth: false,
      );

  @override
  Future<IResponseModel<CreateLSResponse>> createLS(
          CreateLSRequest body) async =>
      networkManager.send<CreateLSRequest, CreateLSResponse>(
        _create,
        parseModel: const CreateLSResponse(),
        type: RequestTypes.post,
        body: body,
      );

  @override
  Future<IResponseModel<CategoriesResponse>> getCategories() async =>
      networkManager.send<CategoriesRequest, CategoriesResponse>(_categories,
          parseModel: const CategoriesResponse(),
          type: RequestTypes.get,
          requireAuth: false);

  @override
  Future<IResponseModel<EnrollLSResponse>> enrollLS(
          EnrollLSRequest body) async =>
      networkManager.send<EnrollLSRequest, EnrollLSResponse>(
        _enrollLS,
        parseModel: const EnrollLSResponse(),
        type: RequestTypes.post,
        body: body,
      );

  @override
  Future<IResponseModel<EnrollLSResponse>> addPost(
          AddPostRequestModel body) async =>
      networkManager.send<AddPostRequestModel, EnrollLSResponse>(_addPost,
          parseModel: const EnrollLSResponse(),
          type: RequestTypes.post,
          body: body);

  @override
  Future<IResponseModel<EnrollLSResponse>> editPost(
          EditPostRequestModel body) async =>
      networkManager.send<EditPostRequestModel, EnrollLSResponse>(_editPost,
          parseModel: const EnrollLSResponse(),
          type: RequestTypes.put,
          body: body);

  @override
  Future<IResponseModel<CreateAnnotationResponse>> createAnnotation(
          Annotation body, String lsId, String postId) async =>
      networkManager.send<Annotation, CreateAnnotationResponse>(
        '$_createAnnotation/$lsId/$postId',
        parseModel: const CreateAnnotationResponse(),
        type: RequestTypes.post,
        body: body,
      );

  @override
  Future<IResponseModel<GetAnnotationsResponse>> getAnnotations(
          String lsId, String postId) async =>
      networkManager.send<GetAnnotationsResponse, GetAnnotationsResponse>(
        '$_getAnnotations/$lsId/$postId',
        parseModel: const GetAnnotationsResponse(),
        type: RequestTypes.get,
      );
}
