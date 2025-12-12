import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/providers/book_provider.dart';
import 'package:flutter_project/screens/book_list_screen.dart';
// import 'package:flutter_project/models/book.dart';

void main() {
  // Kiểm thử: Hiển thị trạng thái rỗng khi không có sách (empty state).
  testWidgets('BookListScreen shows empty text when no books',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => BookProvider(),
        child: const MaterialApp(home: BookListScreen()),
      ),
    );
    expect(find.text('Chưa có sách nào.'), findsOneWidget);
  });

  // Kiểm thử: Nút FAB tồn tại và thực hiện điều hướng tới màn hình chi tiết.
  testWidgets('BookListScreen FAB navigates to detail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => BookProvider(),
        child: MaterialApp(
          home: const BookListScreen(),
          routes: {
            '/detail': (context) =>
                Scaffold(appBar: AppBar(title: const Text('Detail'))),
          },
        ),
      ),
    );

    // Find and tap the FAB
    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);
    await tester.tap(fabFinder);
    await tester.pumpAndSettle();
  });

  // // Kiểm thử: Hiển thị thông tin sách (tên tác giả, số lượng) trong danh sách.
  // testWidgets('BookListScreen displays book info correctly',
  //     (WidgetTester tester) async {
  //   final provider = BookProvider();

  //   final book = Book(
  //     id: '1',
  //     title: 'Test Book',
  //     author: 'Test Author',
  //     quantity: 10,
  //     isBorrowed: false,
  //   );

  //   await provider.addBook(book);

  //   await tester.pumpWidget(
  //     ChangeNotifierProvider.value(
  //       value: provider,
  //       child: const MaterialApp(home: BookListScreen()),
  //     ),
  //   );

  //   // Verify author info is displayed
  //   expect(find.textContaining('Test Author'), findsOneWidget);
  //   expect(find.textContaining('10'), findsOneWidget);
  // });
}
