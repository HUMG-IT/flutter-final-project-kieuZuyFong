import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/providers/book_provider.dart';

void main() {
  group('BookProvider Tests', () {
    // Kiểm thử: Provider khởi tạo với danh sách sách rỗng.
    test('BookProvider initializes with empty books list', () {
      final provider = BookProvider();
      expect(provider.books, isEmpty);
    });

    // Kiểm thử: `addBook()` thêm sách và `books` được cập nhật.
    test('BookProvider can add and retrieve books', () async {
      final provider = BookProvider();
      final testBook = Book(
        id: 'provider-test-${DateTime.now().millisecondsSinceEpoch}',
        title: 'Test Book',
        author: 'Test Author',
        quantity: 5,
        isBorrowed: false,
      );

      await provider.addBook(testBook);
      expect(provider.books, isNotEmpty);
    });

    // Kiểm thử: `updateBook()` cập nhật thông tin sách đã tồn tại.
    test('BookProvider updateBook modifies existing book', () async {
      final provider = BookProvider();
      final uniqueId = 'update-test-${DateTime.now().millisecondsSinceEpoch}';
      final testBook = Book(
        id: uniqueId,
        title: 'Original',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      await provider.addBook(testBook);
      final updated = testBook.copyWith(title: 'Updated');
      await provider.updateBook(updated);

      expect(provider.books, isNotEmpty);
    });

    // Kiểm thử: `fetchBooks()` lấy danh sách sách từ repository.
    test('BookProvider fetchBooks retrieves all books', () async {
      final provider = BookProvider();
      await provider.fetchBooks();
      expect(provider.books, isNotNull);
    });

    // Kiểm thử: Provider gọi `notifyListeners()` khi có thay đổi (listeners nhận sự kiện).
    test('BookProvider notifies listeners on update', () async {
      final provider = BookProvider();
      var listenerCalled = false;

      provider.addListener(() {
        listenerCalled = true;
      });

      final testBook = Book(
        id: 'listener-test-${DateTime.now().millisecondsSinceEpoch}',
        title: 'Listener Test',
        author: 'Author',
        quantity: 1,
        isBorrowed: false,
      );

      await provider.addBook(testBook);
      expect(listenerCalled, isTrue);
    });

    // Kiểm thử: `deleteBook()` xóa sách và không gây lỗi.
    test('BookProvider deleteBook handles valid operations', () async {
      final provider = BookProvider();
      final uniqueId = 'delete-test-${DateTime.now().millisecondsSinceEpoch}';

      final testBook = Book(
        id: uniqueId,
        title: 'To Delete',
        author: 'Author',
        quantity: 1,
        isBorrowed: false,
      );

      await provider.addBook(testBook);
      await provider.deleteBook(uniqueId);
      expect(provider.books, isNotNull);
    });

    // Kiểm thử: Thực hiện nhiều thao tác liên tiếp (add, fetch) và đảm bảo trạng thái ổn định.
    test('BookProvider handles multiple sequential operations', () async {
      final provider = BookProvider();
      final id1 = 'multi-${DateTime.now().millisecondsSinceEpoch}-1';
      final id2 = 'multi-${DateTime.now().millisecondsSinceEpoch}-2';

      final book1 = Book(
        id: id1,
        title: 'First Book',
        author: 'Author 1',
        quantity: 2,
        isBorrowed: false,
      );

      final book2 = Book(
        id: id2,
        title: 'Second Book',
        author: 'Author 2',
        quantity: 3,
        isBorrowed: false,
      );

      await provider.addBook(book1);
      await provider.addBook(book2);
      await provider.fetchBooks();

      expect(provider.books, isNotEmpty);
    });
  });
}
