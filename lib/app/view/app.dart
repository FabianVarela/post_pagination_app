import 'package:flutter/material.dart';
import 'package:post_pagination_app/l10n/generated/app_localizations.dart'
    show AppLocalizations;
import 'package:post_pagination_app/posts/posts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const PostsPage(),
    );
  }
}
