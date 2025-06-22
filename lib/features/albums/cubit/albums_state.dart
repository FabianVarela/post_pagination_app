part of 'albums_cubit.dart';

sealed class AlbumsState extends Equatable {
  const AlbumsState();

  @override
  List<Object?> get props => [];
}

class AlbumsStateInitial extends AlbumsState {
  const AlbumsStateInitial();
}

class AlbumsStateLoading extends AlbumsState {
  const AlbumsStateLoading({required this.albums});

  final List<AlbumResponseModel> albums;

  @override
  List<Object?> get props => [albums];
}

class AlbumsStateLoaded extends AlbumsState {
  const AlbumsStateLoaded({required this.albums, required this.hasLimit});

  final List<AlbumResponseModel> albums;
  final bool hasLimit;

  @override
  List<Object?> get props => [albums, hasLimit];
}

class AlbumsStateError extends AlbumsState {
  const AlbumsStateError();
}
