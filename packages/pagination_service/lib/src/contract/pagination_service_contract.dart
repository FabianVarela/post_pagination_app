import 'package:pagination_service/src/models/models.dart';

/// [PaginationServiceContract] class
abstract interface class PaginationServiceContract {
  /// [getPostList] method used to search a list of posts
  Future<List<PostResponseModel>> getPostList({
    required int page,
    required int limit,
  });

  /// [getAlbumList] method used to search a list of albums
  Future<List<AlbumResponseModel>> getAlbumList({
    required int page,
    required int limit,
  });

  /// [getPhotoList] method used to search a list of photos by [albumId]
  Future<List<PhotoResponseModel>> getPhotoList({
    required int albumId,
    required int page,
    required int limit,
  });
}
