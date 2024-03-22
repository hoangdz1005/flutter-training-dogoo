
## Tổng quan BloC trong Flutter :)
### Giới thiệu
`BLoC` là một pattern được Google giới thiệu, viết tắt của Business Logic Components,  là phương pháp để quản lý state và  events trong các ứng dụng Flutter. Mục đích của  BLoC  là tách biệt logic  ứng dụng với UI từ đó làm cho mã nguồn trở nên trực quan, dễ bảo trì và mở rộng.
### Thành phần của một BloC
- Events: Được kích hoạt bởi giao diện người dùng , là input  đầu vào cho  bloc
- State: trang thái sau khi được biến đổi, là output của bloc
- Bloc: nơi nhận, biến đổi, tạo  ra  state mới , chứa logic ứng dụng
### Hoạt động
- *Tương tác người dùng*: Bắt đầu bằng tương tác người dùng, chẳng hạn như nhấn nút.
- *Gửi sự kiện:* Tương tác này gửi một sự kiện đến BLoC.
- *Tạo trạng thái*: BLoC xử lý sự kiện và tạo ra trạng thái mới.
- *Cập nhật giao diện người dùng:* Giao diện người dùng lắng nghe BLoC và cập nhật tương ứng khi trạng thái mới được phát ra
### Một số cách triển khai Bloc
_**1. Cách triển khai cơ bản, sử dụng các thành phần cốt lõi của Bloc Pattern:**_
- `Bloc`: Quản lý trạng thái và logic nghiệp vụ
- `Event`: Biểu diễn các hành động kích hoạt thay đổi trạng thái.
- `State`: Lưu trữ dữ liệu trạng thái hiện tại.
- `BlocProvider`: Cung cấp Bloc cho các widget trong cây widget.
- `BlocBuilder/BlocListener`: Cập nhật widget dựa trên thay đổi trạng thái.

_**2.  Bloc with RxDart:**_
- Tích hợp RxDart để quản lý luồng dữ liệu và xử lý các sự kiện không đồng bộ:
- Sử dụng Stream để biểu diễn luồng các sự kiện.
- Sử dụng BehaviorSubject để lưu trữ trạng thái hiện tại và phát ra cho các subscriber.
- Sử dụng các toán tử Rx để xử lý luồng dữ liệu và kết hợp các sự kiện.
```dart
class ItemBloc {
  final _itemList = BehaviorSubject<List<Item>>.seeded([]);
  Stream<List<Item>> get itemListStream => _itemList.stream;

  void addItem(Item item) {
    final List<Item> currentList = _itemList.value;
    currentList.add(item);
    _itemList.add(currentList);
  }

  void removeItem(Item item) {
    final List<Item> currentList = _itemList.value;
    currentList.remove(item);
    _itemList.add(currentList);
  }

  void dispose() {
    _itemList.close();
  }
}
```

_**3. Bloc with Flutter Hooks**_

_**4. Bloc withGetX**_

## Cài đặt một số ứng dụng  theo BloC  Pattern
- [Flutter BloC Color App](https://gitlab.dogoo.vn/hoangnn/flutter-training/-/tree/main/Day_9/bloc_color_app)
- [Flutter BloC Articles App](https://gitlab.dogoo.vn/hoangnn/flutter-training/-/tree/main/Day_9/bloc_article_app)

## Tài liệu tham khảo
- [flutter-bloc-cubit-tutorial](https://resocoder.com/2020/08/04/flutter-bloc-cubit-tutorial/)
- [state-management-flutter-bloc-redux](https://semaphoreci.com/blog/state-management-flutter-bloc-redux)
- [flutter-bloc-tutorial-understanding-state-management](https://www.dhiwise.com/post/flutter-bloc-tutorial-understanding-state-management)
