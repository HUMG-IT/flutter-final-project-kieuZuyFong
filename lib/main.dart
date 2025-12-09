import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/book_provider.dart';
import 'screens/book_list_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider()..fetchBooks()),
      ],
      child: MaterialApp(
        title: 'Quản lý Thư viện',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => const BookListScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
