import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagination_service/pagination_service.dart';
import 'package:post_pagination_app/app/dependencies/app_register.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(const PhotosStateInitial());

  late final _paginationService = getIt<PaginationService>();
  late int _currentPage = 1;

  Future<void> loadPhotos({required int albumId, int limit = 20}) async {
    if (state is PhotosStateLoading) return;
    final currentState = state;

    final currentPhotos = <PhotoResponseModel>[
      if (currentState is PhotosStateLoaded) ...currentState.photos,
    ];

    emit(PhotosStateLoading(photos: currentPhotos));
    try {
      final photos = await _paginationService.getPhotoList(
        albumId: albumId,
        page: _currentPage,
        limit: limit,
      );

      if (photos.isNotEmpty) _currentPage++;
      final loadingAlbums = (state as PhotosStateLoading).photos
        ..addAll(photos);

      emit(PhotosStateLoaded(photos: loadingAlbums, hasLimit: photos.isEmpty));
    } catch (error) {
      emit(const PhotosStateError());
    }
  }
}
