import 'package:pagination_service/src/models/models.dart';

abstract class PaginationServiceContract {
  Future<List<PostResponseModel>> getPostList({
    required int page,
    required int limit,
  });
}
