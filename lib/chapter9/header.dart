import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  // Khởi tạo một biến final int index
  const HeaderWidget({
    required Key key,
    required this.index,
  }) : super(key: key);

  // Biến final int index
  final int index;

  // Phương thức build để xây dựng UI
  @override
  Widget build(BuildContext context) {
    // Trả về một Container widget
    return Container(
      // Đặt padding cho Container
      padding: EdgeInsets.all(16.0),
      // Đặt chiều cao cho Container
      height: 120.0,
      // Trả về một Card widget làm con của Container
      child: Card(
        // Đặt độ rộng của bóng cho Card
        elevation: 16.0,
        // Đặt màu của Card
        color: Colors.white,
        // Đặt màu của bóng cho Card
        shadowColor: Colors.cyanAccent,
        // Đặt lề xung quanh cho Card
        margin: EdgeInsets.all(16.0),
        // Tạo đường viền hình chữ nhật bo góc và độ dày cũng như màu của viền
        shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5))),
        // Trả về một Column widget làm con của Card
        child: Column(
          // Căn giữa các con của Column
          mainAxisAlignment: MainAxisAlignment.center,
          // Trả về một danh sách các Widget làm con của Column
          children: <Widget>[
            // Trả về một Text widget làm con của Column
            Text(
              'Barista',
              // Căn giữa text
              textAlign: TextAlign.center,
              // Đặt style cho text
              style: TextStyle(
                // Đặt font chữ đậm
                fontWeight: FontWeight.bold,
                // Đặt kích thước font chữ
                fontSize: 48.0,
                // Đặt màu cho font chữ
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
