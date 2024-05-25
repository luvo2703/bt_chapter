import 'package:flutter/material.dart';

class Exercise7_2 extends StatefulWidget {
  const Exercise7_2({Key? key}) : super(key: key);

  @override
  _Exercise7_2State createState() => _Exercise7_2State();
}

class _Exercise7_2State extends State<Exercise7_2> {
  bool _crossFadeStateShowFirst = true;

  void _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = _crossFadeStateShowFirst ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,//alignment
        children: <Widget>[
          AnimatedCrossFade( // AnimatedCrossFade để tạo hiệu ứng chuyển đổi giữa hai widget con
            duration: Duration(milliseconds: 500), // Thời gian chuyển đổi animation
            //reverseDuration: Duration(milliseconds: 300), // Thời gian chuyển đổi khi animation đảo ngược
            sizeCurve: Curves.bounceOut,// làm cho Container chuyển đổi kích thước theo cách mà nó sẽ “nảy” khi đạt đến kích thước cuối cùng.
            // firstCurve: Curves.linear, // đường cong của Container đầu tiên
            // secondCurve: Curves.linear, // đường cong của Container thứ 2
            crossFadeState: _crossFadeStateShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            // Trạng thái hiển thị của hai widget con
            firstChild: Container( // Container đầu tiên, sẽ được hiển thị khi _crossFadeStateShowFirst là true
              color: Colors.amber,
              height: 100.0,
              width: 100.0,
            ),
            secondChild: Container(
              color: Colors.lime,
              height: 200.0,
              width: 200.0,
            ),
            // layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
            //   return Stack(
            //     alignment: Alignment.center,
            //     children: <Widget>[
            //       Positioned(
            //         key: bottomChildKey,
            //         child: bottomChild,
            //       ),
            //       Positioned(
            //         key: topChildKey,
            //         child: topChild,
            //       ),
            //     ],
            //   );
            // }, //layoutBuilder được sử dụng để xác định cách hai widget con được xếp chồng lên nhau trong AnimatedCrossFade
          ),

          Positioned.fill( // Positioned.fill để căn chỉnh TextButton với Stack
            child: TextButton(
              child: Text('Ấn để đổi màu và kích thước'),
              // Khi nhấn vào button thì gọi hàm _crossFade
              onPressed: _crossFade,

            ),
          ),
        ],
      ),
    );
  }
}