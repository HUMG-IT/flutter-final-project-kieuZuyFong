import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/main.dart';

void main() {
  // Kiểm thử: Smoke test entrypoint ứng dụng, kiểm tra tiêu đề/chỉ dẫn chính.
  testWidgets('MainApp displays library list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that our app displays book list
    expect(find.text('Thư viện'), findsOneWidget);
  });
}
