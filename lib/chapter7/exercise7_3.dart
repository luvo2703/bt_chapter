import 'package:flutter/material.dart';

class Exercise7_3 extends StatefulWidget {
  const Exercise7_3({Key? key}) : super(key: key);

  @override
  _Exercise7_3State createState() => _Exercise7_3State();
}

class _Exercise7_3State extends State<Exercise7_3> {
  double _opacity = 1.0;

  void _animatedOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.3 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500), // thời gian chuyển
        curve: Curves.linear,// làm giảm dần một cách đều đặn trong suốt quá trình . Điều này tạo ra một hiệu ứng fade-out mượt mà.
        opacity: _opacity,
        onEnd: () {
          // Hàm này sẽ được gọi khi animation kết thúc
          print('Đã làm mờ !');
        },
        //alwaysIncludeSemantics: false, // Đặt giá trị này thành false để không luôn bao gồm thông tin ngữ nghĩa //???
        child: Container(
          color: Colors.amber,
          height: 100.0,
          width: 100.0,
          child: TextButton(
            child: Text('Ấn Để Là mờ'),
            // Khi nhấn vào button thì gọi hàm _animatedOpacity
            onPressed: _animatedOpacity,
          ),
        ),
      ),
    );
  }
}
