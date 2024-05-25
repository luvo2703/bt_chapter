//c8_hero animation

import 'package:flutter/material.dart';
import 'fly.dart';

class Exercise8_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: GestureDetector(
            child: Hero(
              tag: 'format_paint hero',//Đây là một định danh duy nhất được sử dụng để liên kết hai widget Hero với nhau trong quá trình chuyển đổi.
              // createRectTween: (Rect? begin, Rect? end) {
              //   return RectTween(begin: begin, end: end);
              // },//Đây là một hàm tạo Tween cho chuyển đổi. Tween định nghĩa cách chuyển đổi giữa hai giá trị.
              // flightShuttleBuilder: ( // Đây là một hàm tạo widget cho chuyển đổi.
              //     BuildContext flightContext,
              //     Animation<double> animation,
              //     HeroFlightDirection flightDirection,
              //     BuildContext fromHeroContext,
              //     BuildContext toHeroContext,
              //     ) {
              //   return DefaultTextStyle(
              //     style: DefaultTextStyle.of(toHeroContext).style,
              //     child: toHeroContext.widget,
              //   );
              // },
              // placeholderBuilder: (BuildContext context, Size heroSize, Widget child) {
              //   return SizedBox(
              //     width: heroSize.width,
              //     height: heroSize.height,
              //     child: child,
              //   );
              // },//Đây là một hàm tạo widget giữ chỗ khi Hero đang thực hiện chuyển đổi.
              transitionOnUserGestures: true,//Nếu đặt là true, chuyển đổi Hero sẽ diễn ra ngay cả khi người dùng đang tương tác với navigation gesture.
              child: Icon( // các widget con của Hero
                Icons.format_paint,
                color: Colors.lightGreen,
                size: 120.0,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fly()),
              );
            },
          ),
        ),
      ),
    );
  }
}
