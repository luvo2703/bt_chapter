import 'package:flutter/material.dart';
import 'exercise7_1.dart';
import 'exercise7_2.dart';
import 'exercise7_3.dart';
import 'exercise7_4.dart';

class Chapter7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chương 7')),
      body: ListView.builder(
        itemCount: 4, // Số lượng bài tập trong Chương 7
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // Dựa vào số thứ tự của bài tập để quyết định điều hướng đến trang nào
              switch (index + 1) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise7_1()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise7_2()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise7_3()),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise7_4()),
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
