import 'package:flutter/material.dart';
import '../models/book.dart';
import '../screens/book_detail_screen.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text('Tác giả: ${book.author} | Số lượng: ${book.quantity}'),
      trailing:
          book.isBorrowed ? const Icon(Icons.check, color: Colors.green) : null,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BookDetailScreen(book: book)),
      ),
    );
  }
}
