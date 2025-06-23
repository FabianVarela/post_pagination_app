import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:post_pagination_app/app/app.dart';

class PaginationListView extends HookWidget {
  const PaginationListView({
    required this.itemBuilder,
    required this.separator,
    required this.itemCount,
    required this.onLoadMore,
    this.isLoading = false,
    this.hasLimit = false,
    super.key,
  });

  final NullableIndexedWidgetBuilder itemBuilder;
  final Widget separator;
  final int itemCount;
  final VoidCallback onLoadMore;
  final bool isLoading;
  final bool hasLimit;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      if (maxScroll - currentScroll <= 200) onLoadMore();
    });

    if (isLoading && itemCount <= 0) {
      return const Center(child: CircularProgressIndicator());
    }

    var isLoadingData = false;
    if (isLoading) isLoadingData = !isLoadingData;

    return KeepAliveWrapper(
      child: ListView.separated(
        controller: scrollController,
        itemCount: switch (hasLimit) {
          true => itemCount,
          false => itemCount + (isLoadingData ? 1 : 0),
        },
        separatorBuilder: (_, __) => separator,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
