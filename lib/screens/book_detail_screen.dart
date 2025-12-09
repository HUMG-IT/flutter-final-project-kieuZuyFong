import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../providers/book_provider.dart';
import '../widgets/custom_text_field.dart';

class BookDetailScreen extends StatefulWidget {
  final Book? book;
  const BookDetailScreen({Key? key, this.book}) : super(key: key);

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _authorController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.book?.title ?? '');
    _authorController = TextEditingController(text: widget.book?.author ?? '');
    _quantityController =
        TextEditingController(text: widget.book?.quantity.toString() ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<BookProvider>(context, listen: false);
      final book = Book(
        id: widget.book?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        author: _authorController.text,
        quantity: int.tryParse(_quantityController.text) ?? 0,
        isBorrowed: widget.book?.isBorrowed ?? false,
      );
      if (widget.book == null) {
        provider.addBook(book);
      } else {
        provider.updateBook(book);
      }
      Navigator.pop(context);
    }
  }

  void _delete() {
    if (widget.book != null) {
      Provider.of<BookProvider>(context, listen: false)
          .deleteBook(widget.book!.id);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? 'Thêm sách' : 'Sửa sách'),
        actions: [
          if (widget.book != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _delete,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(controller: _titleController, label: 'Tên sách'),
              CustomTextField(controller: _authorController, label: 'Tác giả'),
              CustomTextField(
                  controller: _quantityController,
                  label: 'Số lượng',
                  keyboardType: TextInputType.number),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
