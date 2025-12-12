# Testing Guide - Quản lý Thư viện

## 1. Unit Tests

### BookRepository Tests

Kiểm thử các hàm CRUD của repository với LocalStore.

**File:** `test/repository/book_repository_test.dart`

**Chạy test:**

```bash
flutter test test/repository/book_repository_test.dart
```

**Các test case:**

- ✅ Thêm sách (addBook)
- ✅ Lấy danh sách sách (getBooks)
- ✅ Cập nhật sách (updateBook)
- ✅ Xóa sách (deleteBook)

## 2. Widget Tests

### BookListScreen Widget Tests

Kiểm thử giao diện danh sách sách.

**File:** `test/widget/book_list_screen_test.dart`

**Chạy test:**

```bash
flutter test test/widget/book_list_screen_test.dart
```

**Các test case:**

- ✅ Hiển thị "Chưa có sách nào" khi danh sách trống
- ✅ Hiển thị danh sách sách khi có dữ liệu
- ✅ Nhấp vào sách để chuyển đến chi tiết
- ✅ Nhấp nút "+" để thêm sách mới

## 3. Chạy Tất Cả Tests

```bash
flutter test
```

## 4. Xem Coverage

### Cài đặt lcov (Windows)

```bash
choco install lcov
```

### Tạo coverage report

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

Mở file `coverage/html/index.html` trong trình duyệt để xem chi tiết.

## 5. CI/CD Testing

Mỗi khi push lên GitHub, GitHub Actions sẽ tự động chạy:

1. `flutter pub get` — Cài dependencies
2. `flutter analyze` — Phân tích mã
3. `flutter test` — Chạy tất cả tests
4. `flutter build apk` — Build APK (nếu cấu hình)

Kết quả hiển thị tại tab **Actions** trên GitHub.

## 6. Best Practices

✅ Viết test cho mỗi feature quan trọng  
✅ Sử dụng meaningful assertion messages  
✅ Mock external dependencies (API, database)  
✅ Chạy test cục bộ trước khi push  
✅ Kiểm tra coverage để đảm bảo chất lượng

## 7. Ghi Chú

- Các test sử dụng **flutter_test** framework
- Tests chạy trên **VM**, không cần thiết bị/emulator
- Tốc độ chạy test khoảng 5-10 giây
