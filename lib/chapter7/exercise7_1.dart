import 'package:flutter/material.dart';

class Exercise7_1 extends StatefulWidget {
  const Exercise7_1({Key? key}) : super(key: key);

  @override
  _Exercise7_1State createState() => _Exercise7_1State();
}

class _Exercise7_1State extends State<Exercise7_1> {
  double _height = 100.0;
  double _width = 100.0;
  // Hàm tăng chiều rộng của container
  void _increaseWidth() {
    // Gọi hàm setState để cập nhật lại trạng thái của widget
    setState(() {
      // Nếu chiều rộng hiện tại lớn hơn hoặc bằng 320.0 thì đặt lại thành 100.0, ngược lại thì tăng thêm 50.0
      _width = _width >= 320.0 ? 100.0 : _width += 50.0;
    });
  }
  @override
  Widget build(BuildContext context) {
    // Trả về một Center widget chứa AnimatedContainer
    return Center(
      child: AnimatedContainer(
        // Thời gian chuyển đổi animation
        alignment: Alignment.center,
        height: _height,
        width: _width,
        duration: Duration(milliseconds: 500),
        color: Colors.blue,//mau sac cua container
        curve: Curves.elasticOut, // Đường cong của animation
        foregroundDecoration: BoxDecoration(
          color: Colors.red, // Đặt màu sắc của BoxDecoration là màu đỏ.
          backgroundBlendMode: BlendMode.saturation,//Đặt chế độ trộn của
          // BoxDecoration với widget conBlendMode.saturation
          // tạo ra một hiệu ứng mà màu sắc của widget con
          // sẽ được trộn với màu đỏ của BoxDecoration theo chế độ bão hòa.
        ),
        constraints: BoxConstraints(//Nó cho phép bạn đặt các ràng buộc
          // về kích thước cho AnimatedContainer
          minHeight: 50,
          minWidth: 50,
          maxHeight: 200,
          maxWidth: 200,
        ),
        margin: EdgeInsets.all(20.0),//tạo ra một khoảng cách
        // 20 pixels xung quanh AnimatedContainer
        //transform: Matrix4.rotationZ(0.1),//tạo ra một hiệu ứng xoay quanh trục Z
        //transformAlignment: Alignment.center,//??
        child: TextButton(
          // Child widget là một TextButton
          child: Text('An Vao Day: $_width'),
          // Khi nhấn vào button thì gọi hàm _increaseWidth
          onPressed: _increaseWidth,
        ),
        //clipBehavior: Clip.antiAlias,//cac canh sẽ được làm mịn để tránh hiện tượng răng cưa.
      ),
    );
  }
}
