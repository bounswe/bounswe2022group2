import 'dart:core';

import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../models/annotation/create_annotation_request.dart';
import '../models/categories_response_model.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../view/create_learning_space_screen.dart';
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
  static const String _createAnnotation = '/learningspace/annotation';

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
        requireAuth: true,
      );

  @override
  Future<IResponseModel<AnyModel>> annotate(
          CreateAnnotationRequest body) async =>
      networkManager.send<CreateAnnotationRequest, AnyModel>(
        _createAnnotation,
        parseModel: const AnyModel(),
        type: RequestTypes.post,
        body: body,
      );
}
