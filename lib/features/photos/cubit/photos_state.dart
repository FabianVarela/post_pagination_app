part of 'photos_cubit.dart';

sealed class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object?> get props => [];
}

class PhotosStateInitial extends PhotosState {
  const PhotosStateInitial();
}

class PhotosStateLoading extends PhotosState {
  const PhotosStateLoading({required this.photos});

  final List<PhotoResponseModel> photos;

  @override
  List<Object?> get props => [photos];
}

class PhotosStateLoaded extends PhotosState {
  const PhotosStateLoaded({required this.photos, required this.hasLimit});

  final List<PhotoResponseModel> photos;
  final bool hasLimit;

  @override
  List<Object?> get props => [photos, hasLimit];
}

class PhotosStateError extends PhotosState {
  const PhotosStateError();
}
