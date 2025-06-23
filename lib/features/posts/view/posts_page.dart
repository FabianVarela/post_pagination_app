import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:pagination_service/pagination_service.dart';
import 'package:post_pagination_app/app/widgets/pagination_list_view.dart';
import 'package:post_pagination_app/features/posts/cubit/posts_cubit.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit()..loadPosts(),
      child: const PostView(),
    );
  }
}

class PostView extends HookWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostsState>(
      builder: (_, state) {
        final posts = switch (state) {
          PostsStateLoading(posts: final posts) => posts,
          PostsStateLoaded(posts: final posts) => posts,
          _ => <PostResponseModel>[],
        };

        return PaginationListView(
          itemCount: posts.length,
          isLoading: state is PostsStateLoading,
          hasLimit: (state is PostsStateLoaded) && state.hasLimit,
          onLoadMore: () => context.read<PostCubit>().loadPosts(),
          separator: Divider(color: Colors.grey[400]),
          itemBuilder: (_, index) {
            return index < posts.length
                ? _PostListItem(post: posts[index])
                : const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}

class _PostListItem extends StatelessWidget {
  const _PostListItem({required this.post});

  final PostResponseModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Chip(
                    label: const Text(
                      'Community',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    backgroundColor: const Color(0xFF231e7c),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const Gap(16),
                  Text(
                    post.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    post.body,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(16),
                  RichText(
                    text: const TextSpan(
                      text: 'Read more... ',
                      style: TextStyle(fontSize: 14, color: Color(0xFF5173da)),
                      children: <InlineSpan>[
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.arrow_right_alt,
                            color: Color(0xFF5173da),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/200',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
