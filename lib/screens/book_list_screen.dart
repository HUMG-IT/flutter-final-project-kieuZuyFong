import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../widgets/book_item.dart';
import 'book_detail_screen.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Thư viện')),
      body: Consumer<BookProvider>(
        builder: (context, provider, child) {
          final books = provider.books;
          if (books.isEmpty) {
            return const Center(child: Text('Chưa có sách nào.'));
          }
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) => BookItem(book: books[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BookDetailScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
