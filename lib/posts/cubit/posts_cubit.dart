import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pagination/app/dependencies/app_register.dart';
import 'package:pagination_service/pagination_service.dart';

part 'posts_state.dart';

class PostCubit extends Cubit<PostsState> {
  PostCubit() : super(const PostsStateInitial());

  late final PaginationService _paginationService = getIt<PaginationService>();
  late int currentPage = 1;

  Future<void> loadPosts({int limit = 20}) async {
    if (state is PostsStateLoading) return;
    final currentState = state;

    var currentPosts = <PostResponseModel>[];
    if (currentState is PostsStateLoaded) {
      currentPosts = currentState.posts;
    }

    emit(PostsStateLoading(posts: currentPosts));
    try {
      final posts = await _paginationService.getPostList(
        page: currentPage,
        limit: limit,
      );

      if (posts.isNotEmpty) currentPage++;
      final loadingPosts = (state as PostsStateLoading).posts..addAll(posts);

      emit(PostsStateLoaded(posts: loadingPosts, hasLimit: posts.isEmpty));
    } catch (error) {
      emit(const PostsStateError());
    }
  }
}
