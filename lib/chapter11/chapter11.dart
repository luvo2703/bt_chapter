import 'package:flutter/material.dart';
import 'exercise11_1.dart';
import 'exercise11_2.dart';
import 'exercise11_3.dart';


class Chapter11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chương 11')),
      body: ListView.builder(
        itemCount: 3, // Số lượng bài tập trong Chương 11
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // Dựa vào số thứ tự của bài tập để quyết định điều hướng đến trang nào
              switch (index + 1) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise11_1()),
                  );
                  break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercise11_2()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercise11_3()),
                );
              }
            },
            child: Text('Đi đến Bài ${index + 1}'),
          );
        },
      ),
    );
  }
}
