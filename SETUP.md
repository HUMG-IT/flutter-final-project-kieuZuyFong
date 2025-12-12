# Hướng dẫn chạy dự án Flutter - Quản lý Thư viện

## 1. Yêu cầu Hệ thống

- Flutter SDK: 3.19.0+ ([tải tại đây](https://flutter.dev/docs/get-started/install))
- Dart SDK: tự động cài với Flutter
- Android Studio hoặc VS Code
- Emulator Android hoặc thiết bị thực

## 2. Thiết lập Dự án

### Bước 1: Clone repository

```bash
git clone https://github.com/HUMG-IT/flutter-final-project-kieuZuyFong.git
cd flutter-final-project-kieuZuyFong
```

### Bước 2: Cài đặt Dependencies

```bash
flutter pub get
```

### Bước 3: Sinh Code từ Freezed

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 3. Chạy Ứng dụng

### Trên Emulator Android

```bash
flutter run -d emulator-5554
```

### Trên Trình duyệt Web

```bash
flutter run -d chrome
```

### Trên Thiết bị Thực

```bash
flutter run
```

## 4. Kiểm thử

### Chạy tất cả unit test và widget test

```bash
flutter test
```

### Chạy test cụ thể

```bash
flutter test test/repository/book_repository_test.dart
```

### Chạy test với coverage

```bash
flutter test --coverage
```

## 5. Phân tích Mã

```bash
flutter analyze
```

## 6. Build APK

```bash
flutter build apk --split-per-abi
```

## 7. GitHub Actions CI/CD

Mỗi khi bạn push mã lên GitHub (branch main hoặc develop), GitHub Actions sẽ tự động:

- ✅ Cài đặt dependencies
- ✅ Phân tích mã (flutter analyze)
- ✅ Chạy tất cả kiểm thử (flutter test)
- ✅ Build APK (tùy chọn)
- ✅ Upload kết quả

Kiểm tra kết quả tại tab **Actions** trên GitHub repository.

## 8. Cấu trúc Thư mục

```
lib/
├── main.dart                 # Điểm khởi động ứng dụng
├── models/
│   └── book.dart            # Model Book với Freezed
├── repositories/
│   └── book_repository.dart  # Repository CRUD với LocalStore
├── providers/
│   └── book_provider.dart    # Provider quản lý state
├── screens/
│   ├── book_list_screen.dart
│   ├── book_detail_screen.dart
│   └── profile_screen.dart
└── widgets/
    ├── book_item.dart
    └── custom_text_field.dart

test/
├── repository/
│   └── book_repository_test.dart
└── widget/
    └── book_list_screen_test.dart

.github/workflows/
└── flutter.yml              # CI/CD Workflow
```

## 9. Ghi Chú

- Ứng dụng sử dụng **LocalStore** (JSON file-based) để lưu trữ dữ liệu cục bộ.
- **Provider** để quản lý state toàn ứng dụng.
- **Freezed** để tự động sinh code cho data classes.
- **Flutter Test** cho unit test và widget test.

## 10. Hỗ Trợ

Nếu gặp vấn đề, hãy:

1. Chạy `flutter clean` để xóa cache build
2. Chạy `flutter pub get` để cài đặt lại dependencies
3. Kiểm tra `flutter doctor` để đảm bảo môi trường đã sẵn sàng
