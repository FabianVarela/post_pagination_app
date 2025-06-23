import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pagination_service/pagination_service.dart';
import 'package:post_pagination_app/app/widgets/pagination_list_view.dart';
import 'package:post_pagination_app/features/albums/albums.dart';

class AlbumsPage extends StatelessWidget {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumsCubit()..loadAlbums(),
      child: const AlbumView(),
    );
  }
}

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsCubit, AlbumsState>(
      builder: (_, state) {
        final albums = switch (state) {
          AlbumsStateLoading(albums: final albums) => albums,
          AlbumsStateLoaded(albums: final albums) => albums,
          _ => <AlbumResponseModel>[],
        };

        return PaginationListView(
          itemCount: albums.length,
          isLoading: state is AlbumsStateLoading,
          hasLimit: (state is AlbumsStateLoaded) && state.hasLimit,
          onLoadMore: () => context.read<AlbumsCubit>().loadAlbums(),
          separator: const Gap(12),
          itemBuilder: (_, index) {
            return index < albums.length
                ? _AlbumListItem(
                    album: albums[index],
                    onClickAlbum: (value) {},
                  )
                : const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}

class _AlbumListItem extends StatelessWidget {
  const _AlbumListItem({required this.album, required this.onClickAlbum});

  final AlbumResponseModel album;
  final ValueSetter<int> onClickAlbum;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClickAlbum(album.id),
        leading: ClipOval(
          child: SizedBox.square(
            dimension: 40,
            child: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          'ID: ${album.id}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          album.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
