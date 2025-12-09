import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project/models/book.dart';
import 'package:flutter_project/repositories/book_repository.dart';

void main() {
  group('BookRepository', () {
    final repo = BookRepository();
    final book = Book(id: '1', title: 'Test', author: 'Author', quantity: 1);

    test('add and get books', () async {
      await repo.addBook(book);
      final books = await repo.getBooks();
      expect(books.any((b) => b.id == book.id), true);
    });

    test('update book', () async {
      final updated = book.copyWith(title: 'Updated');
      await repo.updateBook(updated);
      final books = await repo.getBooks();
      expect(books.any((b) => b.title == 'Updated'), true);
    });

    test('delete book', () async {
      await repo.deleteBook(book.id);
      final books = await repo.getBooks();
      expect(books.any((b) => b.id == book.id), false);
    });
  });
}
