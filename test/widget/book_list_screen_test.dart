import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/providers/book_provider.dart';
import 'package:flutter_project/screens/book_list_screen.dart';

void main() {
  testWidgets('BookListScreen shows empty text', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => BookProvider(),
        child: const MaterialApp(home: BookListScreen()),
      ),
    );
    expect(find.text('Chưa có sách nào.'), findsOneWidget);
  });
}
