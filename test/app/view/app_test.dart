import 'package:flutter_test/flutter_test.dart';
import 'package:post_pagination_app/app/app.dart';
import 'package:post_pagination_app/posts/posts.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(PostsPage), findsOneWidget);
    });
  });
}
