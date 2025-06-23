import 'package:flutter/material.dart';
import 'package:post_pagination_app/app/router/app_router.dart';
import 'package:post_pagination_app/l10n/l10n.dart';

class App extends StatelessWidget {
  App({super.key}) : _appRouter = AppRouter();

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.router,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
