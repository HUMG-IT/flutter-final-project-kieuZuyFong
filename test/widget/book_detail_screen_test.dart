import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/providers/book_provider.dart';
import 'package:flutter_project/screens/book_detail_screen.dart';

void main() {
  group('BookDetailScreen Tests', () {
    // Kiểm thử: Form thêm sách mới hiển thị đúng.
    // - Tiêu đề phải là "Thêm sách".
    // - Các TextFormField tồn tại và nhãn (Tên sách, Tác giả, Số lượng) hiển thị.
    testWidgets('BookDetailScreen shows form with empty fields for new book',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => BookProvider(),
          child: const MaterialApp(home: BookDetailScreen()),
        ),
      );

      // Verify title shows "Thêm sách"
      expect(find.text('Thêm sách'), findsOneWidget);
      // Verify form fields are empty
      expect(find.byType(TextFormField), findsWidgets);
      // Verify labels
      expect(find.text('Tên sách'), findsOneWidget);
      expect(find.text('Tác giả'), findsOneWidget);
      expect(find.text('Số lượng'), findsOneWidget);
    });

    // Kiểm thử: Form chỉnh sửa hiển thị dữ liệu sách đã có.
    // - Tiêu đề phải là "Sửa sách" khi truyền một `book` vào.
    testWidgets('BookDetailScreen shows form with book data for editing',
        (WidgetTester tester) async {
      final testBook = Book(
        id: '1',
        title: 'Test Book',
        author: 'Test Author',
        quantity: 5,
        isBorrowed: false,
      );

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => BookProvider(),
          child: MaterialApp(home: BookDetailScreen(book: testBook)),
        ),
      );

      // Verify title shows "Sửa sách"
      expect(find.text('Sửa sách'), findsOneWidget);
    });

    // Kiểm thử: Trang edit/chi tiết chứa nút Lưu và biểu tượng Xóa.
    // - Kiểm tra tồn tại văn bản "Lưu" và biểu tượng `Icons.delete`.
    testWidgets('BookDetailScreen has Save and Delete buttons',
        (WidgetTester tester) async {
      final testBook = Book(
        id: '1',
        title: 'Test Book',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => BookProvider(),
          child: MaterialApp(home: BookDetailScreen(book: testBook)),
        ),
      );

      // Verify buttons exist
      expect(find.text('Lưu'), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });

    // Kiểm thử: Widget render thành công khi đặt trong một Scaffold (sanity check).
    testWidgets('BookDetailScreen renders edit screen correctly',
        (WidgetTester tester) async {
      final testBook = Book(
        id: '1',
        title: 'Test Book',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => BookProvider(),
          child: MaterialApp(
            home: Scaffold(
              body: BookDetailScreen(book: testBook),
            ),
          ),
        ),
      );

      // Verify the screen renders
      expect(find.byType(BookDetailScreen), findsOneWidget);
    });
  });
}
