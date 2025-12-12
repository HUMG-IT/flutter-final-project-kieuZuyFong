# Báo Cáo Kết Quả - Ứng Dụng Quản Lý Thư Viện

## Thông Tin Sinh Viên

- **Họ và tên**: Kiều Duy Phong
- **MSSV**: 2121050584
- **Lớp**: DCCTCLC66A1
- **Học phần**: Phát triển ứng dụng di động đa nền tảng 1 (Mã học phần: 7080325)

---

## 1. Mô Tả Ứng Dụng

### Tên Ứng Dụng

**Quản Lý Thư Viện** (Library Management System)

### Mục Đích

Ứng dụng cung cấp một hệ thống quản lý sách đơn giản, cho phép người dùng:

- Xem danh sách sách có trong thư viện
- Thêm sách mới vào thư viện
- Sửa thông tin sách hiện có
- Xóa sách khỏi thư viện
- Xem chi tiết thông tin sách (tác giả, số lượng, trạng thái mượn)

### Đối Tượng Chính

**Model: Book** (Sách)

- `id`: Định danh duy nhất (tự động sinh timestamp)
- `title`: Tên sách (bắt buộc)
- `author`: Tác giả sách (bắt buộc)
- `quantity`: Số lượng sách trong kho (bắt buộc, phải > 0)
- `isBorrowed`: Trạng thái sách đã được mượn hay chưa (mặc định: false)

---

## 2. Quá Trình Phát Triển

### 2.1 Giai Đoạn 1: Phân Tích Và Thiết Kế

- **Công việc**:
  - Phân tích yêu cầu ứng dụng
  - Thiết kế kiến trúc dự án (Model-Repository-Provider-View)
  - Lập kế hoạch công nghệ và thư viện sử dụng
  - Thiết kế cấu trúc thư mục dự án

### 2.2 Giai Đoạn 2: Xây Dựng Data Model

- **Công việc**:
  - Tạo file `lib/models/book.dart` sử dụng **Freezed** để định nghĩa model Book
  - Sinh code tự động bằng `flutter pub run build_runner`
  - Model tự động hỗ trợ: serialization (toJson/fromJson), equality, copyWith

### 2.3 Giai Đoạn 3: Xây Dựng Lớp Repository

- **Công việc**:
  - Tạo file `lib/repositories/book_repository.dart`
  - Cài đặt các hàm CRUD: `addBook()`, `getBooks()`, `updateBook()`, `deleteBook()`
  - Tích hợp **LocalStore** để lưu trữ dữ liệu dưới dạng file JSON cục bộ
  - Xử lý lỗi cơ bản (kiểm tra file, xử lý ngoại lệ)

### 2.4 Giai Đoạn 4: Xây Dựng State Management

- **Công việc**:
  - Tạo file `lib/providers/book_provider.dart` sử dụng **Provider**
  - Cài đặt ChangeNotifier để quản lý danh sách sách
  - Các hàm: `fetchBooks()`, `addBook()`, `updateBook()`, `deleteBook()`
  - Gọi notifyListeners() để cập nhật UI khi có thay đổi

### 2.5 Giai Đoạn 5: Xây Dựng Giao Diện Người Dùng

- **Công việc**:
  - Tạo các màn hình chính:
    - `BookListScreen`: Hiển thị danh sách sách, nút thêm mới
    - `BookDetailScreen`: Form nhập/sửa sách, nút lưu/xóa
    - `ProfileScreen`: Trang thông tin cá nhân (skeleton)
  - Tạo các widget tái sử dụng:
    - `BookItem`: Widget hiển thị một sách trong danh sách
    - `CustomTextField`: Widget nhập liệu tùy chỉnh
  - Cài đặt routes và navigation giữa các màn hình

### 2.6 Giai Đoạn 6: Khắc Phục Lỗi Build Android

- **Vấn đề gặp phải**:
  - Lỗi AGP version: Android Gradle Plugin 8.1.0 thấp hơn yêu cầu 8.1.1
  - Lỗi Kotlin compiler: "Unresolved reference 'io'" và "FlutterActivity"
  - Gradle cache không nhận diện Flutter dependencies
- **Giải pháp**:
  - Xóa thư mục Android cũ
  - Chạy `flutter create . --platforms=android` để tái tạo Android template mới
  - Nâng cấp AGP lên 8.6.0 tự động
  - Xóa cache Gradle (.gradle/build folders)
  - Build thành công sau đó

### 2.7 Giai Đoạn 7: Kiểm Thử Tự Động

- **Công việc**:
  - Tạo unit test cho BookRepository: `test/repository/book_repository_test.dart`
  - Tạo widget test cho BookListScreen: `test/widget/book_list_screen_test.dart`
  - Cài đặt **flutter_test** framework
  - Viết các test case kiểm tra CRUD, hiển thị UI

### 2.8 Giai Đoạn 8: Thiết Lập CI/CD

- **Công việc**:
  - Tạo GitHub Actions workflow: `.github/workflows/flutter.yml`
  - Cấu hình tự động:
    - Cài Flutter SDK
    - Cài dependencies (`flutter pub get`)
    - Phân tích mã (`flutter analyze`)
    - Chạy kiểm thử (`flutter test`)
    - Build APK (tùy chọn)
    - Upload artifacts

---

## 3. Công Nghệ Và Thư Viện Sử Dụng

### 3.1 Framework Chính

| Công Nghệ   | Phiên Bản | Mục Đích                                 |
| ----------- | --------- | ---------------------------------------- |
| **Flutter** | 3.19.0+   | Framework xây dựng giao diện đa nền tảng |
| **Dart**    | 3.5.4+    | Ngôn ngữ lập trình chính                 |

### 3.2 Thư Viện Chính (Dependencies)

| Thư Viện               | Phiên Bản | Mục Đích                            |
| ---------------------- | --------- | ----------------------------------- |
| **provider**           | ^6.0.0    | State management, ChangeNotifier    |
| **localstore**         | ^1.3.5    | Lưu trữ dữ liệu JSON cục bộ (NoSQL) |
| **freezed_annotation** | ^2.0.0    | Tạo data class với serialization    |
| **json_annotation**    | ^4.9.0    | JSON serialization support          |

### 3.3 Thư Viện Phát Triển (Dev Dependencies)

| Thư Viện              | Phiên Bản | Mục Đích                          |
| --------------------- | --------- | --------------------------------- |
| **flutter_test**      | SDK       | Framework kiểm thử tự động        |
| **build_runner**      | latest    | Sinh code từ annotations          |
| **freezed**           | ^2.0.0    | Code generator cho Freezed        |
| **json_serializable** | ^6.0.0    | JSON serialization code generator |

### 3.4 CI/CD

| Công Cụ            | Mục Đích                          |
| ------------------ | --------------------------------- |
| **GitHub Actions** | Tự động chạy kiểm thử khi push/PR |
| **ubuntu-latest**  | Runner OS cho build/test          |

---

## 4. Kiểm Thử Tự Động

### 4.1 Tổng quan (Cập nhật)

- Bộ test hiện có gồm unit tests và widget tests sử dụng `flutter_test`.
- Test kiểm tra các thành phần chính: `Book` model, `BookRepository` (Localstore), `BookProvider` (ChangeNotifier) và widget chính (`BookListScreen`, `BookDetailScreen`).
- Trong quá trình chỉnh sửa, một số test liên quan đến tính năng "mượn" đã bị loại bỏ vì ứng dụng hiện chỉ lưu thuộc tính `isBorrowed` trong model nhưng chưa có hành vi mượn/tra trả trong UI.

### 4.2 Các file test chính

- `test/models/book_model_test.dart` — kiểm tra: khởi tạo model, `toJson`/`fromJson`, `copyWith`, equality.
- `test/repository/book_repository_test.dart` — kiểm tra: `addBook`, `getBooks`, `updateBook`, `deleteBook` (tương tác với `Localstore`).
- `test/providers/book_provider_test.dart` — kiểm tra: trạng thái khởi tạo, `add/update/delete/fetch`, và `notifyListeners()`.
- `test/widget/book_list_screen_test.dart` — widget tests cho `BookListScreen` (empty state, FAB navigation, hiển thị thông tin).
- `test/widget/book_detail_screen_test.dart` — widget tests cho `BookDetailScreen` (form thêm, form sửa, nút Lưu/Xóa, sanity render).
- `test/main_test.dart` — smoke test entrypoint.

### 4.3 Chạy kiểm thử

- Chạy toàn bộ test:

```bash
flutter test
```

- Chạy với coverage:

```bash
flutter test --coverage
```

- Chạy file test cụ thể:

```bash
flutter test test/widget/book_list_screen_test.dart
```

---

## 5. Hướng Dẫn Cài Đặt Và Chạy Ứng Dụng

### 5.1 Yêu Cầu Hệ Thống

- **Flutter SDK**: 3.19.0 trở lên
- **Dart SDK**: Tự động cài với Flutter
- **Android Studio** hoặc **VS Code**
- **Emulator Android** hoặc **Thiết bị thực** (tùy chọn)
- **Git**: Để clone repository

### 5.2 Cài Đặt Từng Bước

#### **Bước 1: Tải Mã Nguồn Từ Repository**

```bash
git clone https://github.com/HUMG-IT/flutter-final-project-kieuZuyFong.git
cd flutter-final-project-kieuZuyFong
```

#### **Bước 2: Cài Đặt Dependencies**

```bash
flutter pub get
```

#### **Bước 3: Sinh Code Từ Freezed (Build Runner)**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Lưu ý**: Bước này tạo ra các file `*.freezed.dart` và `*.g.dart` cần thiết cho model Book

#### **Bước 4: Chạy Ứng Dụng**

**Trên Emulator Android:**

```bash
flutter run -d emulator-5554
```

**Trên Trình Duyệt Web:**

```bash
flutter run -d chrome
```

**Trên Thiết Bị Thực (Android):**

```bash
flutter run
```

**Trên Windows Desktop (nếu cài Visual Studio):**

```bash
flutter run -d windows
```

#### **Bước 5: Kiểm Tra Ứng Dụng Trên Thiết Bị/Emulator**

1. Ứng dụng khởi động với tên "Quản lý Thư viện"
2. Màn hình hiển thị "Chưa có sách nào" (vì database trống)
3. Nhấp nút **"+"** (Floating Action Button) để thêm sách mới

#### **Bước 6: Thực Hiện Các Thao Tác CRUD**

**Thêm (Create) Sách Mới:**

1. Nhấp nút **"+"** trên màn hình danh sách
2. Điền thông tin:
   - Tên sách: VD: "Harry Potter"
   - Tác giả: VD: "J.K. Rowling"
   - Số lượng: VD: "5"
3. Nhấp **"Lưu"**
4. Quay lại danh sách, sách vừa thêm sẽ hiển thị

**Đọc (Read) Sách:**

1. Danh sách sách được hiển thị với thông tin: Tên, Tác giả, Số lượng
2. Nhấp vào một sách để xem chi tiết

**Sửa (Update) Sách:**

1. Nhấp vào sách trong danh sách
2. Sửa thông tin (VD: thay đổi số lượng từ 5 thành 3)
3. Nhấp **"Lưu"**
4. Quay lại danh sách, sách sẽ cập nhật thông tin

**Xóa (Delete) Sách:**

1. Nhấp vào sách để xem chi tiết
2. Nhấp biểu tượng **"🗑️ (Delete)"** ở trên cùng
3. Sách sẽ bị xóa khỏi danh sách

#### **Bước 7: Thực Hiện Kiểm Thử Tự Động**

**Chạy tất cả kiểm thử:**

```bash
flutter test
```

**Kết quả mong đợi:**

```
Precompiling integration executable...
Running integration tests...
[  0%] Downloading Web SDK...                                            3.8s
✓ Test passed
All tests passed
```

**Chạy kiểm thử cụ thể:**

```bash
# Unit test BookRepository
flutter test test/repository/book_repository_test.dart

# Widget test BookListScreen
flutter test test/widget/book_list_screen_test.dart
```

**Phân tích mã nguồn:**

```bash
flutter analyze
```

---

## 6. Tính Năng Chính Của Ứng Dụng

### 6.1 Danh Sách Sách (Book List Screen)

- Hiển thị danh sách tất cả sách
- Mỗi item hiển thị: Tên sách, Tác giả, Số lượng
- Icon tích xanh (✓) nếu sách đã được mượn
- Nút **"+"** để thêm sách mới
- Nhấp vào sách để xem/sửa chi tiết

### 6.2 Chi Tiết Sách (Book Detail Screen)

- Form nhập/sửa thông tin sách
- Các trường: Tên sách, Tác giả, Số lượng
- Nút **"Lưu"** để lưu thay đổi
- Nút **"🗑️"** để xóa sách
- Validation: Các trường không được để trống

### 6.3 Thông Tin Cá Nhân (Profile Screen)

- Placeholder cho chức năng cập nhật thông tin cá nhân
- Chức năng mở rộng cho sau này

### 6.4 Lưu Trữ Dữ Liệu

- Tất cả dữ liệu được lưu trữ cục bộ bằng **LocalStore** (file JSON)
- Dữ liệu được lưu tại: `data_user/0/<app_id>/app_flutter`
- Tự động lưu sau mỗi thao tác CRUD

---

## 7. GitHub Actions CI/CD

### 7.1 Workflow Configuration

**File**: `.github/workflows/flutter.yml`

**Kích hoạt bởi**:

- Push đến branch `main` hoặc `develop`
- Pull Request đến branch `main` hoặc `develop`

### 7.2 Các Bước Tự Động

1. **Checkout code**: Lấy source code từ repository
2. **Setup Flutter**: Cài đặt Flutter SDK 3.19.0
3. **Get dependencies**: Cài đặt các package (flutter pub get)
4. **Code analysis**: Phân tích mã lỗi (flutter analyze)
5. **Run tests**: Chạy tất cả unit/widget tests (flutter test)
6. **Build APK**: Build APK cho Android (tùy chọn, có continue-on-error)
7. **Upload artifacts**: Lưu artifacts/logs (tùy chọn)

### 7.3 Kết Quả Workflow

- ✅ **Success**: Tất cả bước hoàn thành mà không lỗi
- ❌ **Failed**: Có lỗi xảy ra (build fail hoặc test fail)

**Kiểm tra kết quả**: Vào tab **"Actions"** trên GitHub repository

---

## 8. Kết Quả Kiểm Thử

### 8.1 Build Status

- ✅ Android build: **SUCCESS** (sau khi tái tạo Android template)
- ✅ Web build: **SUCCESS**
- ✅ Flutter analyze: **SUCCESS** (chỉ có info về style, không có error)

### 8.2 Test Results

- ✅ Unit tests: **PASSED**
- ✅ Widget tests: **PASSED**
- ✅ All tests: **PASSED**

### 8.3 GitHub Actions

- ✅ Workflow created and configured
- ✅ Auto-run on push to main/develop
- ✅ Auto-run on pull requests

---

## 9. Điểm tự đánh giá

**Tự đánh giá: 8/10 điểm**

### Lý do:

- ✅ **Build thành công** (5/10): GitHub Actions chạy thành công
- ✅ **CRUD đầy đủ** (6/10): Thêm, xem, sửa, xóa sách
- ✅ **State management** (7/10): Provider quản lý trạng thái
- ✅ **Tích hợp LocalStore** (8/10): Lưu trữ dữ liệu JSON cục bộ
- ⚠️ **Chưa đạt 9/10**: UI/UX cơ bản, thiếu một số tính năng nâng cao
- ⚠️ **Chưa đạt 10/10**: Chưa tối ưu hóa hoàn chỉnh, thiếu Firebase, authentication

---

## 10. Tài Liệu Tham Khảo

- **Flutter Documentation**: https://flutter.dev/docs
- **Dart Language**: https://dart.dev/guides
- **Provider Package**: https://pub.dev/packages/provider
- **Freezed Package**: https://pub.dev/packages/freezed
- **LocalStore Package**: https://pub.dev/packages/localstore
- **GitHub Actions**: https://docs.github.com/en/actions
- **Flutter Testing**: https://flutter.dev/docs/testing
