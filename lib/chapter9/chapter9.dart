import 'package:flutter/material.dart';
import 'exercise9_1.dart';
import 'exercise9_2.dart';
import 'exercise9_3.dart';
import 'exercise9_4.dart';

class Chapter9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chương 9')),
      body: ListView.builder(
        itemCount: 4, // Số lượng bài tập trong Chương 9
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // Dựa vào số thứ tự của bài tập để quyết định điều hướng đến trang nào
              switch (index + 1) {
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise9_1()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise9_2()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise9_3()),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise9_4()),
                  );
                  break;
                // case 5:
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Exercise9_5()),
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
