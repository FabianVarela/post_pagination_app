import 'package:flutter_bloc_pagination/app/app.dart';
import 'package:flutter_bloc_pagination/posts/posts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(PostsPage), findsOneWidget);
    });
  });
}
