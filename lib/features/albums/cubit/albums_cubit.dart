import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagination_service/pagination_service.dart';
import 'package:post_pagination_app/app/dependencies/app_register.dart';

part 'albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  AlbumsCubit() : super(const AlbumsStateInitial());

  late final _paginationService = getIt<PaginationService>();
  late int _currentPage = 1;

  Future<void> loadAlbums({int limit = 20}) async {
    if (state is AlbumsStateLoading) return;
    final currentState = state;

    final currentAlbums = <AlbumResponseModel>[
      if (currentState is AlbumsStateLoaded) ...currentState.albums,
    ];

    emit(AlbumsStateLoading(albums: currentAlbums));
    try {
      final albums = await _paginationService.getAlbumList(
        page: _currentPage,
        limit: limit,
      );

      if (albums.isNotEmpty) _currentPage++;
      final loadingAlbums = (state as AlbumsStateLoading).albums
        ..addAll(albums);

      emit(AlbumsStateLoaded(albums: loadingAlbums, hasLimit: albums.isEmpty));
    } catch (error) {
      emit(const AlbumsStateError());
    }
  }
}
