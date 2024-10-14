import 'package:dio/dio.dart';
import 'package:pagination_service/src/contract/pagination_service_contract.dart';
import 'package:pagination_service/src/models/posts/post_response_model.dart';

/// {@template pagination_service}
/// Service used to fetch data from Json Placeholder API
/// {@endtemplate}
class PaginationService implements PaginationServiceContract {
  /// {@macro pagination_service}
  PaginationService({required this.dio});

  /// [Dio] class to get configuration
  final Dio dio;

  static const _postPath = 'posts';

  @override
  Future<List<PostResponseModel>> getPostList({
    required int page,
    required int limit,
  }) async {
    final response = await dio.get<dynamic>(
      _postPath,
      queryParameters: <String, dynamic>{
        '_page': page,
        '_limit': limit,
      },
    );

    if (response.statusCode == 200) {
      final responseList = response.data as List<dynamic>;
      return [
        for (final item in responseList)
          PostResponseModel.fromJson(item as Map<String, dynamic>),
      ];
    } else {
      throw Exception('Error getting posts');
    }
  }
}
