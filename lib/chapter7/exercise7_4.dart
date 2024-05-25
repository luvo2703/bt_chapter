//c7_animatedController

import 'package:flutter/material.dart';

class Exercise7_4 extends StatefulWidget {
  @override
  _Exercise7_4State createState() => _Exercise7_4State();
}

class _Exercise7_4State extends State<Exercise7_4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,//Đây là một TickerProvider, nó tạo ra các “ticker” mà AnimationController sử dụng để tiến trình thời gian.
      //this tức là _MyAnimatedWidgetState đóng vai trò là TickerProvider.
      duration: Duration(seconds: 5),// thời gian diễn ra của animation
      reverseDuration: Duration(seconds: 1), // Thời gian diễn ra khi animation đảo ngược
      debugLabel: 'MyAnimationController', // Đây là một chuỗi mà bạn có thể sử dụng để giúp debug
      // lowerBound: 0.0, // Giới hạn dưới của giá trị animation
      // upperBound: 5.0, // Giới hạn trên của giá trị animation
      animationBehavior: AnimationBehavior.normal, // animation sẽ dừng khi giá trị nằm ngoài giới hạn
    )..repeat(reverse: true); //lặp lại với animated đảo ngược
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedController'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, child) {
            return Transform.scale(
              scale: _controller.value,//// Sử dụng giá trị hiện tại của _controller
              child: child,
            );
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
