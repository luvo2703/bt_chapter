import 'package:flutter/material.dart';
import 'exercise5_1.dart';

class Chapter5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chương 5')),
      body: ListView.builder(
        itemCount: 1, // Số lượng bài tập trong Chương 5
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // Dựa vào số thứ tự của bài tập để quyết định điều hướng đến trang nào
              switch (index + 1) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Exercise5_1()),
                  );
                  break;
                // case 2:
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Exercise6_2()),
                //   );
                //   break;
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
