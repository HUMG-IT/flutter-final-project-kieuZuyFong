import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin cá nhân')),
      body: const Center(
        child: Text('Chức năng cập nhật thông tin cá nhân và đổi mật khẩu.'),
      ),
    );
  }
}
