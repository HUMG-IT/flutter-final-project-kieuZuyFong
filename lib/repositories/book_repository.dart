import 'package:localstore/localstore.dart';
import '../models/book.dart';

class BookRepository {
  final _db = Localstore.instance;
  final String _collection = 'books';

  Future<void> addBook(Book book) async {
    await _db.collection(_collection).doc(book.id).set(book.toJson());
  }

  Future<List<Book>> getBooks() async {
    final items = await _db.collection(_collection).get();
    if (items == null) return [];
    return items.values
        .map((e) => Book.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<void> updateBook(Book book) async {
    await _db.collection(_collection).doc(book.id).set(book.toJson());
  }

  Future<void> deleteBook(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }
}
