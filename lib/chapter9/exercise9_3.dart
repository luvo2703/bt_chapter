//Stack
import 'package:flutter/material.dart';

class Exercise9_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack '),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center, // đặt các widget ở giữa màn hình
            //textDirection: TextDirection.ltr, // đặt hướng văn bản từ phải sang trái.
            //fit: StackFit.loose, // cho phép các widget con có kích thước nhỏ hơn kích thước tối đa mà Stack có thể cung cấp.
            clipBehavior: Clip.hardEdge, //bất kỳ phần nào của phần tử con nằm ngoài ranh giới của GridView sẽ bị cắt đi hoàn toàn .
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color: Colors.yellow,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
              // Text(
              //   'Đêm qua mưa thật là to Trăng sao ướt hết tối mò buồn ghê Sáng nay trời vội trở về Chiếu muôn tia nắng trên đê trong làng',
              //   style: TextStyle(fontSize: 24, color: Colors.lightGreen),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}