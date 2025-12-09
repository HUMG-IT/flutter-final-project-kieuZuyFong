import 'package:flutter/material.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';

class BookProvider with ChangeNotifier {
  final BookRepository _repository = BookRepository();
  List<Book> _books = [];
  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    _books = await _repository.getBooks();
    notifyListeners();
  }

  Future<void> addBook(Book book) async {
    await _repository.addBook(book);
    await fetchBooks();
  }

  Future<void> updateBook(Book book) async {
    await _repository.updateBook(book);
    await fetchBooks();
  }

  Future<void> deleteBook(String id) async {
    await _repository.deleteBook(id);
    await fetchBooks();
  }
}
