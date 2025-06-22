import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagination_service/pagination_service.dart';
import 'package:post_pagination_app/app/dependencies/app_register.dart';

part 'posts_state.dart';

class PostCubit extends Cubit<PostsState> {
  PostCubit() : super(const PostsStateInitial());

  late final _paginationService = getIt<PaginationService>();
  late int _currentPage = 1;

  Future<void> loadPosts({int limit = 20}) async {
    if (state is PostsStateLoading) return;
    final currentState = state;

    final currentPosts = <PostResponseModel>[
      if (currentState is PostsStateLoaded) ...currentState.posts,
    ];

    emit(PostsStateLoading(posts: currentPosts));
    try {
      final posts = await _paginationService.getPostList(
        page: _currentPage,
        limit: limit,
      );

      if (posts.isNotEmpty) _currentPage++;
      final loadingPosts = (state as PostsStateLoading).posts..addAll(posts);

      emit(PostsStateLoaded(posts: loadingPosts, hasLimit: posts.isEmpty));
    } catch (error) {
      emit(const PostsStateError());
    }
  }
}
