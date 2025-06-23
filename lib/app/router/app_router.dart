import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:post_pagination_app/app/widgets/navigator_tab_container.dart';
import 'package:post_pagination_app/features/albums/albums.dart';
import 'package:post_pagination_app/features/photos/view/photos_page.dart';
import 'package:post_pagination_app/features/posts/posts.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  AppRouter()
    : _router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        observers: [HeroController()],
        initialLocation: '/posts',
        routes: <RouteBase>[
          StatefulShellRoute.indexedStack(
            branches: <StatefulShellBranch>[
              StatefulShellBranch(
                observers: [HeroController()],
                navigatorKey: _shellNavigatorKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: '/posts',
                    pageBuilder: (_, state) => const NoTransitionPage(
                      child: PostsPage(),
                    ),
                  ),
                ],
              ),
              StatefulShellBranch(
                observers: [HeroController()],
                routes: <RouteBase>[
                  GoRoute(
                    path: '/albums',
                    pageBuilder: (_, state) => const NoTransitionPage(
                      child: AlbumsPage(),
                    ),
                    routes: <RouteBase>[
                      GoRoute(
                        path: ':id',
                        builder: (_, state) {
                          final pathId = state.pathParameters['id'] ?? '';
                          return PhotosPage(albumId: int.tryParse(pathId)!);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
            builder: (_, state, navigationShell) {
              return NavigatorTabContainer(navigationShell: navigationShell);
            },
          ),
        ],
        debugLogDiagnostics: kDebugMode,
      );

  final GoRouter _router;

  GoRouter get router => _router;
}
