import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class NavigatorTabContainer extends HookWidget {
  const NavigatorTabContainer({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination App'),
        bottom: TabBar(
          controller: tabController,
          onTap: navigationShell.goBranch,
          tabs: const <Tab>[
            Tab(text: 'Posts', icon: Icon(Icons.post_add_outlined)),
            Tab(text: 'Albums', icon: Icon(Icons.photo_album_outlined)),
          ],
        ),
      ),
      body: HeroMode(child: navigationShell),
    );
  }
}
