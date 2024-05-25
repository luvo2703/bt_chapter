//c8_bottom apbar

import 'package:flutter/material.dart';


class Exercise8_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppBar'),
      ),
      body: SafeArea(
        child: Container(),
      ),
      bottomNavigationBar: BottomAppBar( // BottomAppBar là một thanh điều hướng dưới cùng, thường chứa các nút điều hướng.
        color: Colors.white70, // Đặt màu sắc cho thanh điều hướng là màu blue
        shape: CircularNotchedRectangle(), // Đặt hình dạng cho thanh điều hướng.
        //elevation: 50.0,// đổ bóng ??? chưa thấy
        //clipBehavior: Clip.hardEdge,//các widget con sẽ không bị cắt xén, ngay cả khi chúng vẽ ra ngoài ranh giới
        // của BottomAppBar >>>chưa thấy khác biệt
        //notchMargin: 20.0,// tạo ra một khoảng cách là 20.0 giữa FloatingActionButton và BottomAppBar
        child: Row( // Row là một widget chứa danh sách các widget con được sắp xếp theo chiều ngang.
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Căn chỉnh các widget con để chúng cách đều nhau.
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              // padding: EdgeInsets.all(20.0), // Tạo padding đều cho tất cả các cạnh với giá trị là 20.0.
              // child: Text('Hello'),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), // Tạo padding đối xứng cho các cạnh dọc và ngang
              // child: Text('Hello'),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              // padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0), // Tạo padding cho từng cạnh riêng lẻ, theo thứ tự: trái, trên, phải, dưới.
              // child: Text('Hello'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked, // Đặt vị trí cho nút hành động nổi endDocked
      floatingActionButton: FloatingActionButton( // FloatingActionButton là một nút hành động nổi
        onPressed: () {}, // Xử lý sự kiện khi nút được nhấn.
        child: Icon(Icons.add), // Đặt biểu tượng cho nút.
        //backgroundColor: Colors.purple, // Thêm màu cho FloatingActionButton

      ),
    );
  }
}
