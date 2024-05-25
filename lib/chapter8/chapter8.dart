import 'package:flutter/material.dart';
import 'exercise8_1.dart';
import 'exercise8_2.dart';
import 'exercise8_3.dart';
import 'exercise8_4.dart';
import 'exercise8_5.dart';


class Chapter8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chương 8')),
      body: ListView.builder(
        itemCount: 5, // Số lượng bài tập trong Chương 4
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // Dựa vào số thứ tự của bài tập để quyết định điều hướng đến trang nào
              switch (index + 1) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise8_1()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise8_2()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise8_3()),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise8_4()),
                  );
                  break;
                case 5:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise8_5()),
                  );
                  break;
              // Thêm các trường hợp khác cho các bài tập khác ở đây
              }
            },
            child: Text('Đi đến Bài ${index + 1}'),
          );
        },
      ),
    );
  }
}
