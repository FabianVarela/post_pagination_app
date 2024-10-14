import 'package:pagination_service/src/models/models.dart';

/// [PaginationServiceContract] class
abstract interface class PaginationServiceContract {
  /// [getPostList] method used to search a list of posts
  Future<List<PostResponseModel>> getPostList({
    required int page,
    required int limit,
  });
}
