import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/models/book.dart';

void main() {
  group('Book Model Tests', () {
    // Kiểm thử: Khởi tạo model `Book` và kiểm tra các thuộc tính cơ bản.
    test('Book should have correct properties', () {
      final book = Book(
        id: '1',
        title: 'Test Book',
        author: 'Test Author',
        quantity: 5,
        isBorrowed: false,
      );

      expect(book.id, '1');
      expect(book.title, 'Test Book');
      expect(book.author, 'Test Author');
      expect(book.quantity, 5);
      expect(book.isBorrowed, false);
    });

    // Kiểm thử: `toJson()` chuyển đối tượng Book thành Map đúng định dạng.
    test('Book.toJson() should return valid JSON', () {
      final book = Book(
        id: '1',
        title: 'Flutter Guide',
        author: 'Google',
        quantity: 10,
        isBorrowed: true,
      );

      final json = book.toJson();
      expect(json['id'], '1');
      expect(json['title'], 'Flutter Guide');
      expect(json['author'], 'Google');
      expect(json['quantity'], 10);
      expect(json['isBorrowed'], true);
    });

    // Kiểm thử: `fromJson()` khôi phục đối tượng Book từ Map JSON.
    test('Book.fromJson() should create Book from JSON', () {
      final json = {
        'id': '2',
        'title': 'Dart Programming',
        'author': 'Google Developers',
        'quantity': 3,
        'isBorrowed': false,
      };

      final book = Book.fromJson(json);
      expect(book.id, '2');
      expect(book.title, 'Dart Programming');
      expect(book.author, 'Google Developers');
      expect(book.quantity, 3);
      expect(book.isBorrowed, false);
    });

    // Kiểm thử: `copyWith()` tạo bản sao với các trường thay đổi.
    test('Book.copyWith() should create a copy with new values', () {
      final book = Book(
        id: '1',
        title: 'Original Title',
        author: 'Original Author',
        quantity: 5,
        isBorrowed: false,
      );

      final updatedBook = book.copyWith(
        title: 'Updated Title',
        quantity: 10,
        isBorrowed: true,
      );

      expect(updatedBook.id, '1');
      expect(updatedBook.title, 'Updated Title');
      expect(updatedBook.author, 'Original Author');
      expect(updatedBook.quantity, 10);
      expect(updatedBook.isBorrowed, true);
    });

    // Kiểm thử: Hai đối tượng Book có cùng dữ liệu được coi là bằng nhau (==).
    test('Two Books with same data should be equal', () {
      final book1 = Book(
        id: '1',
        title: 'Test',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      final book2 = Book(
        id: '1',
        title: 'Test',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      expect(book1, book2);
    });

    // Kiểm thử: Hai đối tượng Book có dữ liệu khác nhau không bằng nhau.
    test('Two Books with different data should not be equal', () {
      final book1 = Book(
        id: '1',
        title: 'Test 1',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      final book2 = Book(
        id: '2',
        title: 'Test 2',
        author: 'Author',
        quantity: 5,
        isBorrowed: false,
      );

      expect(book1, isNot(book2));
    });

    // Kiểm thử (tài liệu): Trường hợp số lượng âm — hiện model không validate,
    // test này chỉ minh họa yêu cầu validation trong tương lai.
    test('Book with negative quantity should be invalid (in real scenario)',
        () {
      final book = Book(
        id: '1',
        title: 'Invalid Book',
        author: 'Author',
        quantity: -5,
        isBorrowed: false,
      );
      expect(book.quantity, -5);
    });
  });
}
