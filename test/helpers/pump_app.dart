import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_pagination_app/l10n/generated/app_localizations.dart'
    show AppLocalizations;

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
