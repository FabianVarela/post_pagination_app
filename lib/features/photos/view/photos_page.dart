import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pagination_service/pagination_service.dart';
import 'package:post_pagination_app/app/widgets/pagination_list_view.dart';
import 'package:post_pagination_app/features/photos/cubit/photos_cubit.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({required this.albumId, super.key});

  final int albumId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotosCubit()..loadPhotos(albumId: albumId),
      child: PhotosView(albumId: albumId),
    );
  }
}

class PhotosView extends StatelessWidget {
  const PhotosView({required this.albumId, super.key});

  final int albumId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (_, state) {
        final photos = switch (state) {
          PhotosStateLoading(photos: final photos) => photos,
          PhotosStateLoaded(photos: final photos) => photos,
          _ => <PhotoResponseModel>[],
        };

        return Padding(
          padding: const EdgeInsets.all(16),
          child: PaginationListView(
            itemCount: photos.length,
            isLoading: state is PhotosStateLoading,
            hasLimit: (state is PhotosStateLoaded) && state.hasLimit,
            onLoadMore: () => context.read<PhotosCubit>().loadPhotos(
              albumId: albumId,
            ),
            separator: const Gap(12),
            itemBuilder: (_, index) {
              return index < photos.length
                  ? const _PhotoListItem()
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}

class _PhotoListItem extends StatelessWidget {
  const _PhotoListItem();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: .circular(10),
          child: Image.network('https://picsum.photos/200', fit: .fill),
        ),
      ),
    );
  }
}
