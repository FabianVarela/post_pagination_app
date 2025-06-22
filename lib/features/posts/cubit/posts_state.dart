part of 'posts_cubit.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object?> get props => [];
}

class PostsStateInitial extends PostsState {
  const PostsStateInitial();
}

class PostsStateLoading extends PostsState {
  const PostsStateLoading({required this.posts});

  final List<PostResponseModel> posts;

  @override
  List<Object?> get props => [posts];
}

class PostsStateLoaded extends PostsState {
  const PostsStateLoaded({required this.posts, required this.hasLimit});

  final List<PostResponseModel> posts;
  final bool hasLimit;

  @override
  List<Object?> get props => [posts, hasLimit];
}

class PostsStateError extends PostsState {
  const PostsStateError();
}
